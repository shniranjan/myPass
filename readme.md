# myPass

A small command-line utility that derives deterministic passwords from a master
secret and copies the result to the system clipboard for a limited period of
time. The clipboard is cleared automatically to avoid leaving sensitive values
behind.

## Features
- Deterministic password generation using either legacy SHA-1 or salted AIX MD5
  hashing, matching the behaviour of the original script.
- Automatic clipboard clearing after a configurable timeout (10 seconds by
  default).
- Prompts for secrets without echoing input to the terminal.
- Minimal dependencies: `bash`, `xclip`, `openssl`, `shasum`, `rev`, and `awk`.

## Prerequisites
Ensure the following packages are installed on your system:

```bash
sudo apt-get install bash xclip openssl coreutils awk perl
```

The `shasum` utility ships with `perl` on many distributions. Adjust the package
manager command as required for your platform.

## Installation
Run the installer script to fetch the latest version and place it in
`/usr/local/bin`:

```bash
curl -s https://raw.githubusercontent.com/shniranjan/myPass/master/install.sh | sudo bash
```

Alternatively, clone this repository and copy `myPass` to a directory that is on
your `PATH`.

## Usage
Invoke `myPass` without arguments to generate a salted password using the
embedded default salt:

```bash
myPass
```

You will be prompted for your master code, and the resulting password will be
copied to the clipboard for 10 seconds. The following options are available:

| Option | Description |
| ------ | ----------- |
| `-a`, `--added` | Generate an unsalted SHA-1 hash (legacy mode). |
| `-s`, `--salted` | Prompt for an additional salt before hashing. |
| `-h`, `--help` | Display the built-in help text. |

The clipboard retention period can be adjusted by setting the
`CLIPBOARD_TIMEOUT` environment variable:

```bash
CLIPBOARD_TIMEOUT=20 myPass -s
```

## Troubleshooting
- **`Invalid MIT-MAGIC-COOKIE-1 key(base)`** – Allow local clients to access the
  X server before running the script:

  ```bash
  xhost +local:
  ```

## Security considerations
- Keep your master code and optional salts secret; anyone with both can derive
the generated password.
- Avoid running the script on untrusted machines where clipboard content may be
intercepted.
- Consider lowering the clipboard timeout when using shared systems.
