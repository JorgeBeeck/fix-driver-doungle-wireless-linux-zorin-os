#!/bin/bash

echo "🔊 USB Audio Auto-Fix (PipeWire / Pulse)"
echo "--------------------------------------"

# Verificação básica
if ! command -v pactl >/dev/null 2>&1; then
  echo "❌ pactl não encontrado."
  exit 1
fi

# Sink ativo
SINK=$(pactl get-default-sink 2>/dev/null)

if [ -z "$SINK" ]; then
  echo "❌ Nenhum sink padrão detectado."
  exit 1
fi

echo "✅ Sink detectado:"
echo "   $SINK"

# Script que será executado automaticamente
FIX_SCRIPT="$HOME/.local/bin/audio-usb-fix.sh"
mkdir -p "$HOME/.local/bin"

cat > "$FIX_SCRIPT" << 'EOF'
#!/bin/bash
sleep 2

SINK=$(pactl get-default-sink 2>/dev/null)
[ -z "$SINK" ] && exit 0

# Garantias
pactl set-sink-mute "$SINK" 0
pactl set-sink-balance "$SINK" 0
pactl set-sink-volume "$SINK" 30%
EOF

chmod +x "$FIX_SCRIPT"

echo "✅ Hook criado:"
echo "   $FIX_SCRIPT"

# Hook PipeWire
HOOK_DIR="$HOME/.config/pipewire/pipewire.conf.d"
mkdir -p "$HOOK_DIR"

cat > "$HOOK_DIR/99-usb-audio-fix.conf" << EOF
context.exec = [
  { path = "$FIX_SCRIPT" }
]
EOF

echo "✅ Hook PipeWire instalado"

# Aplica imediatamente
echo "🔄 Aplicando agora..."
systemctl --user restart pipewire pipewire-pulse 2>/dev/null

echo
echo "🎧 Correção ativa"
echo "🔁 Será reaplicada automaticamente ao conectar o headset ou reiniciar"
