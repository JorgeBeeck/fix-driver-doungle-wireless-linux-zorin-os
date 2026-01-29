# USB Audio Auto-Fix (PipeWire / PulseAudio)

Script genérico para corrigir problemas comuns de áudio em headsets USB no Linux  
(testado no Zorin OS, mas funciona em qualquer distro com PipeWire/Pulse).

---

## ❗ Problema resolvido

Em alguns headsets USB (especialmente wireless com dongle), ocorre:

- 🔇 Um dos lados (geralmente o direito) para de funcionar ao baixar o volume
- ⚖️ Balance L/R fica desconfigurado automaticamente
- 🔁 O problema volta após reboot ou reconectar o headset
- 🎚️ Volume fica inconsistente entre aplicativos

Isso é causado por:
- estado quebrado de volume/balance
- `flat-volumes`
- inicialização incorreta do PipeWire
- sinks USB que não lidam bem com volume por canal

---

## ✅ O que este script faz

- Detecta automaticamente o sink de áudio ativo
- Centraliza o balance (L/R = 50/50)
- Garante que o áudio não esteja mutado
- Aplica um volume global seguro (30%)
- Cria um **hook automático do PipeWire**
- Reaplica a correção:
  - no boot
  - ao reiniciar o áudio
  - ao reconectar o headset

Tudo sem depender de:
- marca do headset
- modelo
- GUI
- ferramentas gráficas (Zenity, etc.)

---

## 📋 Pré-requisitos

O sistema precisa usar PipeWire com compatibilidade PulseAudio.

### Verificar se `pactl` existe:
```bash
pactl info
