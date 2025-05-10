# Contador com Timer0 e Display de 7 Segmentos – PIC16F877A em Assembly

Este projeto implementa um contador utilizando o **Timer0** do microcontrolador **PIC16F877A**, configurado como contador de eventos externos. A cada pulso enviado ao pino **RB4/T0CKI** (através de um botão), o valor do contador é incrementado e exibido em um **display de 7 segmentos** conectado ao **PORTD**. Toda a lógica foi escrita em **linguagem Assembly**, no padrão **PIC-AS (XC8)**.

---

## ⚙️ Funcionalidades

- Contagem de 0 a 9 com reinício automático após o 9.
- Controle por botão conectado à entrada externa **RB4/T0CKI**.
- Exibição do valor em um display de 7 segmentos.
- Utilização do **Timer0 como contador de eventos externos**.
- Código 100% em Assembly compatível com o compilador XC8 (PIC-AS).

---

## 🎯 Objetivo

Demonstrar o uso prático do **Timer0 do PIC16F877A** como **contador de borda de subida**, acionado por eventos externos, com visualização em tempo real em um display de 7 segmentos. O projeto é útil para o ensino de:

- Manipulação de registradores do Timer0;
- Programação em Assembly estruturada;
- Leitura de sinais digitais externos;
- Exibição de dados em display de 7 segmentos.

---

## 🧰 Materiais Utilizados

- **Microcontrolador:** PIC16F877A  
- **Ambiente de Desenvolvimento:** MPLAB X IDE  
- **Compilador:** XC8 (modo Assembly – PIC-AS)  
- **Simulador:** PICgenios   
- **Display de 7 segmentos** (catodo comum)  
- **Botão (push-button)**  
- **Cristal de 4 MHz**  
- **Resistores** (220Ω a 1kΩ para os segmentos)

---

## 🔌 Conexões

| Pino         | Função                           |
|--------------|----------------------------------|
| RB4/T0CKI    | Entrada de pulso (botão)         |
| PORTD (D0–D6)| Segmentos do display             |
| Vcc / GND    | Alimentação                      |
| MCLR         | Reset externo com pull-up        |

---

## 📁 Arquivos

- `contador_timer0.asm` – Código-fonte principal em Assembly
- `README.md` – Descrição do projeto


