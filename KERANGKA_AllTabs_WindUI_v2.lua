--[[
    KERANGKA MENU TAB -> WindUI (VERSI FINAL)
    Urutan sesuai permintaan terbaru - 11 tab, TIDAK di-flatten lagi.
    Automation & Reroll masing-masing CUMA 1 tab (sub-fitur di dalamnya diatur
    pakai Section/Group nanti waktu pengisian fungsi, bukan dipecah jadi tab sidebar).

    Tambahan: profil user (avatar + username Roblox asli) di pojok kiri-bawah sidebar,
    di bawah tab Theme - pakai config native `User` WindUI (pengganti CreateUserProfile()
    di baris 1132-1172 source asli).

    Pemetaan tab -> baris source asli (referensi buat pengisian fungsi nanti):
      1. Main        -> PANEL: MAIN (3812)
      2. Hide         -> PANEL: HIDE (5171)
      3. Farm         -> PANEL: FARM (5571)
      4. Mass Attack  -> PANEL: ATTACK (6785)
      5. Automation   -> Auto Raid (13577), Auto Ascension (14700), Auto Siege (16029),
                         Single Tower Map2 (17293), Join To Tower (17486), Join To Raid (17800)
      6. Reroll       -> Hero Fastroll (7241), Weapon Fastroll (7633), Pet Gear (8002),
                         Halo (8217), Ornament (8311)
      7. Player       -> PANEL: PLAYER (7022)
      8. Setting      -> PANEL: SETTINGS (19002)
      9. Webhook      -> PANEL: WEBHOOK (19113)
      10. Config      -> PANEL: CONFIG (20199)
      11. Theme       -> PANEL: THEME (21364)

      [belum dipetakan ke tab mana - tunggu instruksi]: Claim Reward (18167),
        Anniversary Celebration (18475) -- kemungkinan masuk ke dalam tab Main atau
        tab tersendiri, BELUM ditentukan di list barumu. Tanya saya nanti kalau sudah sampai sana.
--]]

-- ── LOAD WINDUI ───────────────────────────────────────────────────────────
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/mhankbe/WindUi/refs/heads/main/dist/main.lua"))()

-- ── WINDOW (+ floating minimize bubble, sudah teruji OK) ────────────────
local Window = WindUI:CreateWindow({
    Title  = "Auto Farming ASH",
    Icon   = "sword",
    Theme  = "Dark",
    Folder = "premium_rejoin",

    OpenButton = {
        Title           = "FLa",
        CornerRadius    = UDim.new(0, 12),
        StrokeThickness = 2,
        Enabled         = true,
        Draggable       = true,
        OnlyMobile      = false,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,    Color3.fromRGB(25, 45, 115)),
            ColorSequenceKeypoint.new(0.55, Color3.fromRGB(55, 105, 255)),
            ColorSequenceKeypoint.new(1,    Color3.fromRGB(90, 145, 255)),
        }),
    },

    -- ── Pengganti CreateUserProfile() (baris 1132-1172 source asli) ────
    -- Tampil di pojok kiri-bawah sidebar, di bawah tab terakhir (Theme).
    User = {
        Enabled   = true,
        Anonymous = false, -- false = tampilkan nama & avatar Roblox ASLI (bukan disamarkan)
        Callback  = function()
            -- Placeholder. Source asli nggak ada aksi klik di profil (cuma tampilan).
            -- Kalau kamu mau ada aksi waktu profil diklik (misal copy User ID), kasih tau saya nanti.
        end,
    },
})

Window:SetToggleKey(Enum.KeyCode.LeftAlt)

-- ============================================================================
-- 11 TAB SESUAI URUTAN TERBARU
-- ============================================================================

local MainTab = Window:Tab({
    Title = "Main",
    Icon  = "home",
})

local HideTab = Window:Tab({
    Title = "Hide",
    Icon  = "eye-off",
})

local FarmTab = Window:Tab({
    Title = "Farm",
    Icon  = "sword",
})

local MassAttackTab = Window:Tab({
    Title = "Mass Attack",
    Icon  = "swords",
})

local AutomationTab = Window:Tab({
    Title = "Automation",
    Icon  = "bot", -- 1 tab saja; Auto Raid/Ascension/Siege/dll diatur di DALAM tab ini nanti
})

local RerollTab = Window:Tab({
    Title = "Reroll",
    Icon  = "dices", -- 1 tab saja; Hero/Weapon/Pet/Halo/Ornament Fastroll diatur di DALAM tab ini nanti
})

local PlayerTab = Window:Tab({
    Title = "Player",
    Icon  = "user",
})

local SettingTab = Window:Tab({
    Title = "Setting",
    Icon  = "settings",
})

local WebhookTab = Window:Tab({
    Title = "Webhook",
    Icon  = "send",
})

local ConfigTab = Window:Tab({
    Title = "Config",
    Icon  = "save",
})

local ThemeTab = Window:Tab({
    Title = "Theme",
    Icon  = "palette",
})

print("[Kerangka] 11 tab + profil user WindUI sudah dibuat - belum ada fungsi.")
