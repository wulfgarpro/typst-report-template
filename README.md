# typst-report-template

A reusable Typst report template with structured title pages, headers/footers, and professional 
layout defaults.

## Build

### Docker build

Build a Docker image (`typst-report-builder`) with Typst and the template pre-installed:

```sh
./build-image.sh
```

Then compile your report:

```sh
docker run --rm \
  -v "$PWD":/work \
  -w /work type-report-builder:0.1.0 \
  compile --root /work main.typ main.pdf
```

### Local build

Install the template as a local Typst package.

On Linux:

```sh
mkdir -p ~/.local/share/typst/packages/local/typst-report-template
cp -r 0.1.0 ~/.local/share/typst/packages/local/typst-report-template/
```

Then in your report:

```typst
#import "@local/typst-report-template:0.1.0": *
```

And build:

```sh
typst compile --root . main.typ main.pdf
```

## Minimal example

A minimal working example is available in [`0.1.0/template`](0.1.0/template).

A rendered PDF of this example is available at [`0.1.0/example.pdf`](0.1.0/example.pdf).
