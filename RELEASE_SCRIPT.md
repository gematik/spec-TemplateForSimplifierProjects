# Release Script

This Python script is designed to update the release version number and date in specified files within a project. It reads a configuration file in YAML format, which contains the information on which files and patterns to update.

## Features

* Update release version number and date in specified files.
* Use branch name as new release version.
* Output commit messages since the last release.
* Load configuration from an external YAML file.
* Allow multiple regex patterns for each replacement information.

## Prerequisites

* Python 3.6 or higher
* The following Python libraries: `argparse`, `datetime`, `os`, `re`, `subprocess`, `yaml`

## Usage

To run the script, use the following command:

```bash
python update_release.py [options]
```

### Options

* `-b, --branch`: Get the new version number from the current branch name.
* `-v, --version VERSION`: Specify the new version number directly.
* `-d, --date DATE`: Specify the custom date for the release in the format `dd.mm.yyyy`. If not provided, the current date will be used.
* `-c, --config CONFIG`: Specify the path to the YAML configuration file. Default is `config.yaml`.
* `-o, --output`: Output the commit messages since the last release.

**Note:** You must provide either `-b` or `-v` to specify the new release version.

### Configuration File

The script uses a YAML configuration file to determine which files to update and which patterns to match for version and date replacements. The structure of the configuration file should be as follows:

```yaml
filename:
  - type: (version|date)
    regex: (regular expression pattern or list of patterns)
    format: (optional date format)
```

Example

```yaml
package.json:
  - type: version
    regex: '("version":\s*")([\d\.]+.*)(")'
sushi-config.yaml:
  - type: version
    regex: '(version:\s*")(\d+\.\d+\.\d+.*)(")'
ruleset.fsh:
  - type: version
    regex:
      - '(\*\s*version\s*=\s*")([\d\.]+.*)(")'
      - '(\*\s*\^version\s*=\s*")([\d\.]+.*)(")'
  - type: date
    regex: '(\*\s*date\s*=\s*")(\d+\-\d+\-\d+)(")'
    format: '%Y-%m-%d'
Einfuehrung.md:
  - type: version
    regex: '(Version: \s*)(\d+\.\d+\.\d+.*)()'
  - type: date
    regex: '(Datum:\s*)(\d+\.\d+\.\d+.*)()'
    format: '%d.%m.%Y'

```
