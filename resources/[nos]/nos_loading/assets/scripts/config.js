Config = {}; // Don't touch

// Social media buttons on the left side
Config.Socials = [
    { name: "discord", label: "Discord", description: "Cliquez ici pour rejoindre le serveur Discord !", icon: "assets/media/icons/discord.png", link: "https://discord.gg/q54jY3sw6c" },
    { name: "VIP", label: "Boutique VIP", description: "Visitez notre boutique VIP !", icon: "assets/media/icons/e.png", link: "https://discord.gg/q54jY3sw6c" },
    { name: "rules", label: "Règlements du serveur", description: "Prenez connaissance de nos règlements !", icon: "assets/media/icons/rules.png", link: "https://discord.gg/q54jY3sw6c" },
];

Config.HideoverlayKeybind = 72 // JS key code https://keycode.info
Config.CustomBindText = "H"; // leave as "" if you don't want the bind text in html to be statically set

// Music
Config.Song = Math.random() < 0.5 ? "song.mp3" : "song2.mp3";
Config.SongVolume = 0.08;