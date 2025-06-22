# KeijinAutoVendor

**Version:** v0.1.5
**Author:** Keijin (Sascha)  
**Platform:** Turtle WoW (Classic 1.12)

---

## 📌 Description (EN) 
KeijinAutoVendor is a lightweight addon that automatically sells poor quality (gray) items and repairs your gear when visiting a vendor.

- Modular design: clean separation between sell and repair logic
- Debug mode for safe testing
- Fully compatible with Turtle WoW (1.12)
- Based on the battle-tested logic of GrayAutoSell by Thomas T. Cremers

---

## 📦 Module Structure
- `core.lua` – Main entry point, event registration, slash commands
- `auto_vendor_sell.lua` – Queued selling of gray items (delayed with OnUpdate timer)
- `auto_vendor_repair.lua` – Automatic repair logic

---

## 💬 Commands
- `/kav` – General info
- `/kav debug` – Toggles debug mode

---

## 🛠 Credits
**Based on GrayAutoSell v0.1.4**  
by Thomas T. Cremers <ttcremers@gmail.com>  
License: GNU GPL v2  
Source: https://github.com/ttcremers/GrayAutoSell

---

## 📌 Beschreibung (DE)
KeijinAutoVendor ist ein schlankes Addon, das automatisch graue Gegenstände verkauft und deine Ausrüstung repariert, wenn du einen Händler besuchst.

- Modulare Struktur: Verkauf und Reparatur getrennt
- Debug-Modus für kontrolliertes Testen
- Vollständig Turtle WoW (1.12)-kompatibel
- Basierend auf der bewährten Logik von GrayAutoSell von Thomas T. Cremers

---

## 📦 Modulübersicht
- `core.lua` – Einstiegspunkt, Eventregistrierung, Slash-Befehle
- `auto_vendor_sell.lua` – Verkauf grauer Items (zeitverzögert per OnUpdate)
- `auto_vendor_repair.lua` – Reparatur-Logik

---

## 💬 Befehle
- `/kav` – Übersicht
- `/kav debug` – Debugmodus aktivieren/deaktivieren

---

## 🛠 Credits
**Basierend auf GrayAutoSell v0.1.4**  
von Thomas T. Cremers <ttcremers@gmail.com>  
Lizenz: GNU GPL v2  
Quelle: https://github.com/ttcremers/GrayAutoSell
