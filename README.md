# USB Wireless Audio Fix (PipeWire / PulseAudio)

🇧🇷 **Português** | 🇺🇸 **English below**

Script genérico para corrigir problemas de áudio em headsets **USB wireless** no Linux  
(testado no Zorin OS, funciona em qualquer distro com PipeWire/PulseAudio).

---

## ❗ Problema resolvido

Em alguns headsets USB wireless (dongle), ocorre:

- 🔇 Um dos lados para de funcionar ao baixar o volume
- ⚖️ Balance L/R fica desconfigurado
- 🔁 O problema volta após reboot ou reconectar o headset
- 🎚️ Volume se comporta de forma inconsistente

Causas comuns:
- estado quebrado de volume/balance
- sinks USB sensíveis a volume por canal
- inicialização incorreta do PipeWire

---

## ✅ O que o script faz

- Detecta automaticamente o sink ativo
- Centraliza o balance (50/50)
- Garante que o áudio não esteja mutado
- Aplica volume global seguro
- Cria um **hook automático do PipeWire**
- Reaplica a correção no boot e ao reiniciar o áudio

Funciona sem depender de:
- marca/modelo do headset
- interface gráfica
- ferramentas extras (Zenity, etc.)

---

## 📋 Pré-requisitos

O sistema precisa usar PipeWire com compatibilidade PulseAudio.

### Verificar:

🚀 Como rodar o script
chmod +x fix-driver-wireless-linux.sh
./fix-driver-wireless-linux.sh


Durante a execução:

o sink ativo é detectado

o hook é instalado

o áudio é reiniciado automaticamente

🔁 O que é instalado
Script de correção
~/.local/bin/audio-usb-fix.sh

Hook do PipeWire
~/.config/pipewire/pipewire.conf.d/99-usb-audio-fix.conf

🧪 Teste rápido
pactl set-sink-volume @DEFAULT_SINK@ 30%


Resultado esperado:

✅ som nos dois lados

✅ nenhum canal corta

✅ volume desce de forma uniforme

♻️ Remoção
rm ~/.local/bin/audio-usb-fix.sh
rm ~/.config/pipewire/pipewire.conf.d/99-usb-audio-fix.conf
systemctl --user restart pipewire pipewire-pulse

📌 Observação

Se necessário, faça logout/login ou reinicie o sistema para garantir
que o PipeWire carregue o hook desde o início da sessão.

📜 Licença

MIT — use, modifique e distribua livremente.

USB Wireless Audio Fix (PipeWire / PulseAudio)

---

🇺🇸 English version


Você pode substituir somente a seção em inglês do README por esta.

# USB Wireless Audio Fix (PipeWire / PulseAudio)

Generic script to fix common audio issues on **USB wireless headsets** on Linux  
(tested on Zorin OS, works on any PipeWire/PulseAudio-based distro).

---

## ❗ Problem solved

Some USB wireless headsets may experience:

- One audio channel stops working when lowering volume
- Left/right balance becomes broken
- The issue returns after reboot or reconnect
- Inconsistent volume behavior

Common causes include:

- Corrupted volume or balance state
- USB audio sinks that mishandle per-channel volume
- Incorrect PipeWire startup order

---

## ✅ What this script does

- Automatically detects the active audio sink
- Resets balance to center (50/50)
- Ensures the audio output is not muted
- Applies a safe global volume level
- Installs an **automatic PipeWire hook**
- Reapplies the fix on boot and audio restart

This works independently of:

- Headset brand or model
- Graphical interfaces
- Extra tools (Zenity, etc.)

---

## 📋 Requirements

The system must be using PipeWire with PulseAudio compatibility.

### Check:
```bash
pactl info
```

🚀 How to run

```bash
chmod +x fix-driver-wireless-linux.sh
./fix-driver-wireless-linux.sh
```

During execution:

The active sink is detected

The PipeWire hook is installed

Audio services are restarted automatically

🔁 Installed files
Fix script
~/.local/bin/audio-usb-fix.sh

PipeWire hook
~/.config/pipewire/pipewire.conf.d/99-usb-audio-fix.conf

🧪 Quick test
pactl set-sink-volume @DEFAULT_SINK@ 30%


Expected result:

Sound works on both channels

No channel drop

Smooth and consistent volume control

♻️ Uninstall
rm ~/.local/bin/audio-usb-fix.sh
rm ~/.config/pipewire/pipewire.conf.d/99-usb-audio-fix.conf
systemctl --user restart pipewire pipewire-pulse

📌 Note

If needed, log out and log back in or reboot the system to ensure PipeWire loads
the hook from the beginning of the session.

📜 License

MIT — free to use, modify and distribute.

