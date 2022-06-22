{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        inherit (builtins) map listToAttrs elemAt;
        inherit (pkgs.lib.strings) splitString removeSuffix hasSuffix;
        inherit (pkgs.lib.lists) last;
        inherit (pkgs.lib.attrsets) mapAttrs';
        srcs = [
          ./2017-01-17-darkkirb-kirby-waving.jxl
          ./2017-01-20-darkkirb-kirby-and-waddle-dee-playing-hide-and-seek.jxl
          ./2017-05-13-darkkirb-kirbys-first-catch.jxl
          ./2017-06-17-darkkirb-magolor-patchland.jxl
          ./2017-09-03-darkkirb-kirbysweatpcpfp.jxl
          ./2017-09-08-darkkirb-twitter-banner.jxl
          ./2017-09-09-darkkirb-kirby-drawing-himself.jxl
          ./2017-09-11-darkkirb-sailor-kirby.jxl
          ./2017-09-16-darkkirb-sleepy-animal-kirby.jxl
          ./2017-10-05-darkkirb-kirbypumpkin.jxl
          ./2017-10-06-darkkirb-backdrop-kirby.jxl
          ./2017-10-10-darkkirb-sorapfp.jxl
          ./2017-10-23-darkkirb-kirby-battle-royale-ending.jxl
          ./2017-11-09-darkkirb-sleep-kirby-with-plush.jxl
          ./2017-11-21-darkkirb-animal-dee.jxl
          ./2017-11-26-darkkirb-digging-animal-dee.jxl
          ./2017-11-28-darkkirb-surfing-water-kirby.jxl
          ./2018-01-05-darkkirb-animal-kirby-with-balloon.jxl
          ./2018-03-17-darkkirb-kirby-gooey.jxl
          ./2018-10-05-darkkirb-kirby-goomy.jxl
          ./2019-01-10-ceeza-kirby-umbrella-gift.jxl
          ./2019-01-10-nyceryx-animal-kirby-gift.jxl
          ./2019-05-27-bigsneks-charlottebust.jxl
          ./2019-07-01-bigsneks-charlottebust-transparent.jxl
          ./2019-10-05-dae-lotteheart.jxl
          ./2019-10-05-dae-lottehearts.jxl
          ./2019-10-05-dae-lottepet.jxl
          ./2019-11-17-workerq-lottetrash.jxl
          ./2019-11-26-sammythetanuki-lotteheartpfp.jxl
          ./2020-01-05-dae-lotteweary.jxl
          ./2020-01-17-workerq-lotteblep.jxl
          ./2020-01-17-workerq-lottecoffee.jxl
          ./2020-01-17-workerq-lottecookie.jxl
          ./2020-01-17-workerq-lottehug.jxl
          ./2020-01-17-workerq-lottesmile.jxl
          ./2020-03-10-workerq-lotte-drinking-coffee.jxl
          ./2020-06-02-workerq-pridelotte.jxl
          ./2020-07-24-urbankitsune-bna-ych.jxl
          ./2020-09-28-kern-lottebust.jxl
          ./2020-10-01-quinn-sloopkity.jxl
          ./2020-10-06-quinn-lottepumpkin.jxl
          ./2020-10-30-quinn-lottecoffe-large-transparent.jxl
          ./2021-01-16-urbankitsune-acevalid.jxl
          ./2021-01-27-ceeza-lottedonut.jxl
          ./2021-01-31-namelesscryptid-fuckblue.jxl
          ./2021-03-12-quinn-me-lotteupsidedown.jxl
          ./2021-03-12-sammythetanuki-lotteref.jxl
          ./2021-03-23-sammythetanuki-lottegoodsalt.jxl
          ./2021-03-23-sammythetanuki-lottegoods.jxl
          ./2021-03-26-zomlette-agender-screem.jxl
          ./2021-03-26-zomlette-agender-screem-tp.jxl
          ./2021-03-29-quinn-lotteboba.jxl
          ./2021-04-12-muttvore-iconace.jxl
          ./2021-04-12-muttvore-iconagender.jxl
          ./2021-04-12-muttvore-iconenby.jxl
          ./2021-04-21-sammythetanuki-lottecoffeemachine.jxl
          ./2021-05-03-sammythetanuki-lotteflatfuck.jxl
          ./2021-05-03-sammythetanuki-lottehug.jxl
          ./2021-05-03-sammythetanuki-lottesnuggle.jxl
          ./2021-05-03-sammythetanuki-lottetrash2.jxl
          ./2021-05-03-sammythetanuki-lottetrash.jxl
          ./2021-05-04-mizuki-lotteshocked.jxl
          ./2021-05-04-mizuki-lotteshocked-sticker.jxl
          ./2021-05-29-purerubydragon-pridepaw-blank.jxl
          ./2021-05-29-sammythetanuki-lottepizza.jxl
          ./2021-05-30-purerubydragon-lottepawsfixed.jxl
          ./2021-05-30-purerubydragon-lottepawspridefixed.jxl
          ./2021-06-19-sammythetanuki-skonks.jxl
          ./2021-06-20-sammythetanuki-skonks-colored.jxl
          ./2021-07-02-sammythetanuki-lottegrab.jxl
          ./2021-07-16-sammythetanuki-lottecarostacc.jxl
          ./2021-08-03-sammythetanuki-everyonesproblem.jxl
          ./2021-08-03-sammythetanuki-everyonesproblem-sp.jxl
          ./2021-08-03-sammythetanuki-everyonesproblemtext.jxl
          ./2021-09-13-sammythetanuki-plushhug.jxl
          ./2021-09-15-cloverhare-lotteplush.jxl
          ./2021-10-11-sammythetanuki-tailhug.jxl
          ./2021-10-29-butterskunk-lotte-scat-buffet.jxl
          ./2021-11-01-cleareclair-pawiconcircle.jxl
          ./2021-11-01-cleareclair-pawiconsquare.jxl
          ./2021-11-01-cleareclair-pawwallpaper.jxl
          ./2021-11-14-sammythetanuki-lottepat.jxl
          ./2021-11-27-theroguez-lottegassyvore1.jxl
          ./2021-12-12-baltnwolf-christmas-diaper.jxl
          ./2021-12-12-baltnwolf-christmas-diaper-messy.jxl
          ./2021-12-18-sammythetanuki-lottecookies.jxl
          ./2021-12-20-sammythetanuki-lottecrimmus.jxl
          ./2022-01-08-sammythetanuki-donottherac.jxl
          ./2022-01-08-sammythetanuki-lotteangry.jxl
          ./2022-01-08-sammythetanuki-lottechirr.jxl
          ./2022-01-08-sammythetanuki-lottepleading.jxl
          ./2022-01-08-sammythetanuki-oalaekije.jxl
          ./2022-02-20-sammythetanuki-lottehacking.jxl
          ./2022-02-20-sammythetanuki-lottehacking-notext.jxl
          ./2022-04-20-cloverhare-mxbatty-maffsie-train-plush.jxl
          ./2022-04-20-cloverhare-mxbatty-me-train-maffsie-plush.jxl
          ./2022-05-02-anonfurryartist-giftart.jxl
          ./2022-05-05-sammythetanuki-lotteass.jxl
          (./. + "/2022-06-13-󱦀󱦐󱥦󱤋󱤻󱤏󱦑-󱤌󱦖󱤻󱥦󱦓󱦀󱦐󱤫󱥅󱥭󱤋󱦑󱤧󱥬󱤏󱤂-󱥠.jxl")
          ./2022-06-13-sammythetanuki-lotteplushnothoughts.jxl
          ./2022-06-13-sammythetanuki-lotteplushnothoughts-text.jxl
          ./2022-06-21-sammythetanuki-lotteplushpride.jxl
        ];
        extract-version = s: elemAt (splitString "-" s) 0;
        extract-artist = s: elemAt (splitString "-" s) 1;
        pkgs-base = listToAttrs (map (x: {
          name = removeSuffix ".jxl" (last (splitString "/" (toString x)));
          value = x;
        }) srcs);
        pkgs-jxl = mapAttrs' (name: value: {
          name = "${name}-jxl";
          inherit value;
        }) pkgs-base;
        pkgs-png = mapAttrs' (name: value: {
          name = "${name}-png";
          value = pkgs.stdenvNoCC.mkDerivation {
            name = "${name}.png";
            version = extract-version name;
            meta.artist = extract-artist name;
            nativeBuildInputs = [pkgs.imagemagick];
            src = pkgs.emptyDirectory;
            buildPhase = ''
              convert ${value} $out
            '';
            installPhase = "true";
          };
        }) pkgs-base;
        pkgs-jpg = mapAttrs' (name: value: {
          name = "${name}.jpg";
          value = pkgs.stdenvNoCC.mkDerivation {
            name = "${name}-jpg";
            version = extract-version name;
            meta.artist = extract-artist name;
            nativeBuildInputs = [pkgs.imagemagick];
            src = pkgs.emptyDirectory;
            buildPhase = ''
              convert ${value} $out
            '';
            installPhase = "true";
          };
        }) pkgs-base;
      in rec {
        formatter = pkgs.alejandra;
        stuff = pkgs-base;
        packages = pkgs-jxl // pkgs-png // pkgs-jpg;

        hydraJobs = if hasSuffix "-linux" system then packages else {};
      }
    );
}
