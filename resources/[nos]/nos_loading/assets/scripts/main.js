$(".hideoverlay .bind").html(Config.CustomBindText == "" ? String.fromCharCode(Config.HideoverlayKeybind).toUpperCase() : Config.CustomBindText)

$(document).on('mousemove', function (e) {
    $('#cursor').css({ top: e.pageY + 'px', left: e.pageX + 'px' });
});

var overlay = true;
$(document).keydown(function (e) {
    if (e.which == Config.HideoverlayKeybind) {
        overlay = !overlay;
        if (!overlay) {
            $(".overlay").css("opacity", ".0")
        } else {
            $(".overlay").css("opacity", "")
        }
    }
})

var song;
function setup() {
    const currentDate = new Date().toLocaleDateString('fr-CA', {
        day: 'numeric',
        month: 'long',
        year: 'numeric'
    });

    $("#date").text(currentDate)


    const currentTime = new Date().toLocaleTimeString('fr-CA', {
        hour: '2-digit',
        minute: '2-digit'
    });

    $("#time").text(currentTime)

    // Update the time every second
    setInterval(() => {
        const currentTime = new Date().toLocaleTimeString('fr-CA', {
            hour: '2-digit',
            minute: '2-digit'
        });

        $("#time").text(currentTime)
    }, 30000);
}

// Music
// song = Math.random(0, 1) ? new Audio("assets/media/song.mp3") : new Audio("assets/media/song2.mp3");
song = new Audio("assets/media/" + Config.Song);
song.play()
song.volume = Config.SongVolume;

// Socials
Config.Socials.forEach((social, index) => {
    $(".categories .socialmedia").append(`<div class="box" data-id="${social.name}" data-link="${social.link}"><img class="icon" src="${social.icon}"><div class="info"><p class="title">${social.label}</p><p class="description">${social.description}</p></div></div>`)
});

var copyTimeouts = {};
$(".categories .socialmedia .box").on("click", function () {
    let id = $(this).data("id")
    let link = $(this).data("link")
    if (copyTimeouts[id]) clearTimeout(copyTimeouts[id]);

    window.open(link, '_blank', 'toolbar=0,location=0,menubar=0');

    $(this).addClass("copied");
    copyTimeouts[id] = setTimeout(() => {
        $(this).removeClass("copied")
        copyTimeouts[id] = undefined;
    }, 1000);
})

function loadProgress(progress) {
    $(".loader .filled-logo").css("height", progress + "%");

    const progressText = document.createElement('span');
    progressText.textContent = progress + "%";
    $(".loader .progress").empty().append(progressText);
}

window.addEventListener('message', function (e) {
    if (e.data.eventName === 'loadProgress') {
        loadProgress(parseInt(e.data.loadFraction * 100));
    }
});

var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
var muted = false;
function onYouTubeIframeAPIReady() {
    player = new YT.Player("youtube-player", {
        events: {
            'onReady': onPlayerReady
        }
    });
}

let interval;
function onPlayerReady() {
    player.mute();

    $('#sounds').on("change", function () {
        muted = !muted;
        clearInterval(interval)
        if (muted) {
            $('#play').css("color", "#000");
            $('#pause').css("color", "#fff");

            song.pause();

            // let volume = 0.3;
            // interval = setInterval(() => {
            //     if (volume > 0.00) {
            //         volume -= 0.02
            //         song.volume = volume;
            //     } else {
            //         clearInterval(interval)
            //         song.volume = .0;
            //     }
            // }, 1);
        } else {
            $('#play').css("color", "#fff");
            $('#pause').css("color", "#000");

            song.play();

            // let volume = 0.0;
            // interval = setInterval(() => {
            //     if (volume < 1.00) {
            //         volume += 0.02
            //         song.volume = volume;
            //     } else {
            //         clearInterval(interval)
            //         song.volume = 0.3;
            //     }
            // }, 1);
        }
    });
}

function copyToClipboard(text) {
    const body = document.querySelector('body');
    const area = document.createElement('textarea');
    body.appendChild(area);

    area.value = text;
    area.select();
    document.execCommand('copy');

    body.removeChild(area);
}

setup();
