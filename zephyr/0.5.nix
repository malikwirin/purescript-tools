{
  stdenv,
  fetchFromGitHub,
  mkDerivation, aeson, ansi-terminal, ansi-wl-pprint, async, base
, boxes, bytestring, containers, directory, filepath, formatting
, Glob, hspec, hspec-core, HUnit, language-javascript, lib, mtl
, optparse-applicative, process, purescript, QuickCheck, safe, text
, transformers, unordered-containers, utf8-string
}:

stdenv.mkDerivation rec {
  pname = "zephyr";
  version = "0.5.2";

  src = fetchFromGitHub {
    owner = "MaybeJustJames";
    repo = "zephyr";
    rev = "v${version}";
    hash = "sha256-IoaWpqs5Gs9l0u7fmm5pT+x54uWr0LpBGSzInclvZOg=";
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson ansi-terminal base boxes containers formatting
    language-javascript mtl purescript safe text unordered-containers
  ];
  executableHaskellDepends = [
    aeson ansi-terminal ansi-wl-pprint async base bytestring containers
    directory filepath formatting Glob language-javascript mtl
    optparse-applicative purescript text transformers utf8-string
  ];
  testHaskellDepends = [
    aeson base containers directory hspec hspec-core HUnit
    language-javascript mtl optparse-applicative process purescript
    QuickCheck text transformers
  ];
  testToolDepends = [ purescript ];

  meta = {
    description = "Tree shaking breeze for PureScript CoreFn AST";
    homepage = "https://github.com/MaybeJustJames/zephyr";
    changelog = "https://github.com/MaybeJustJames/zephyr/blob/${src.rev}/ChangeLog.md";
    license = lib.licenses.mpl20;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "zephyr";
    platforms = lib.platforms.all;
  };
}
