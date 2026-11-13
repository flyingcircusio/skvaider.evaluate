{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  env.GREET = "skvaider.evaluate";

  # github codespaces integration
  devcontainer.enable = true;
  # `devenv test` (the default) works in .devenv/test-state, so it never fills
  # .devenv/state/venv. Enter the regular shell instead: that runs uv sync.
  devcontainer.settings.updateContentCommand = "devenv shell -- true";
  devcontainer.settings.customizations.vscode = {
    extensions = [
      "mkhl.direnv"
      "ms-python.python"
      # Pylance comes bundled with ms-python.python; basedpyright replaces it.
      "-ms-python.vscode-pylance"
      "charliermarsh.ruff"
      "detachhead.basedpyright"
    ];
    settings = {
      # The venv that uv sync populates on shell entry (see below).
      "python.defaultInterpreterPath" = "\${workspaceFolder}/.devenv/state/venv/bin/python";
      # basedpyright provides the language server; keep Pylance out of the way.
      "python.languageServer" = "None";
      # Use the tool versions pinned in uv.lock instead of the bundled ones.
      "ruff.importStrategy" = "fromEnvironment";
      "basedpyright.importStrategy" = "fromEnvironment";
      "[python]" = {
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
    };
  };

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  # https://devenv.sh/languages/
  languages.python.enable = true;
  languages.python.uv.enable = true;
  languages.python.uv.sync.enable = true;
  languages.python.uv.sync.allGroups = true;

  # https://devenv.sh/processes/
  processes.dev.exec = "${lib.getExe pkgs.watchexec} --restart -w src -w uv.lock -w pyproject.toml -- uv run skvaider-evaluate web";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # Install the prek git hook using the version pinned in uv.lock. Forced so
  # hooks left over from pre-commit get replaced instead of chained.
  enterShell = ''
    uv run --frozen --quiet prek install --force --quiet
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
    uv run pytest
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
