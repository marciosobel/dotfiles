{
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/KrstlSkll69/vc-snippets/main/OtherStuff/Maxwell.css"
      ];

      plugins = {
        alwaysTrust.enable = true;
        anonymiseFileNames.enable = true;
        betterSessions.enable = true;
        betterUploadButton.enable = true;
        BlurNSFW.enable = true;
        ClearURLs.enable = true;
        copyEmojiMarkdown.enable = true;
        crashHandler.enable = true;
        fakeNitro.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        friendInvites.enable = true;
        friendsSince.enable = true;
        gifPaste.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLinkEmbeds.enable = true;
        noF1.enable = true;
        noTypingAnimation.enable = true;
        oneko.enable = true;
        petpet.enable = true;
        pictureInPicture.enable = true;
        PinDMs.enable = true;
        spotifyCrack.enable = true;
        typingTweaks.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
