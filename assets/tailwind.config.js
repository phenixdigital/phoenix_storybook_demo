// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const colors = require("tailwindcss/colors");
const plugin = require("tailwindcss/plugin");
const path = require("path");
const fs = require("fs");

module.exports = {
  content: [
    "./js/**/*.js",
    "./css/**/*.css",
    "../lib/**/*.*ex",
    "../storybook/**/*.exs",
    "../**/*.*exs",
    "../../../config/*.*exs",
  ],
  important: ".storybook-demo-sandbox",
  darkMode: "selector",
  safelist: [
    {
      pattern: /bg-(blue|indigo|purple|pink)-.*/,
    },
  ],
  theme: {
    extend: {
      colors: {
        default: {
          DEFAULT: colors.gray[600],
        },
        "default-txt": {
          DEFAULT: colors.gray[600],
          secondary: colors.gray[500],
          informative: colors.gray[400],
          hover: colors.indigo[600],
        },
        "default-border": {
          DEFAULT: colors.gray[200],
        },
        "default-bg": {
          DEFAULT: colors.gray[50],
          disabled: colors.gray[100],
          hover: colors.gray[100],
        },
        "default-btn": {
          DEFAULT: colors.gray[200],
          hover: colors.gray[50],
          focus: colors.gray[400],
          disabled: colors.gray[100],
        },
        primary: {
          DEFAULT: colors.indigo[600],
        },
        "primary-txt": {
          DEFAULT: colors.indigo[600],
          secondary: colors.indigo[600],
        },
        "primary-bg": {
          DEFAULT: colors.indigo[50],
          hover: colors.indigo[100],
        },
        "primary-btn": {
          DEFAULT: colors.indigo[200],
          hover: colors.indigo[50],
          focus: colors.indigo[400],
          disabled: colors.indigo[100],
        },
        success: {
          DEFAULT: colors.emerald[500],
        },
        "success-txt": {
          DEFAULT: colors.emerald[500],
          secondary: colors.emerald[400],
        },
        "success-bg": {
          DEFAULT: colors.emerald[50],
          hover: colors.emerald[100],
        },
        "success-btn": {
          DEFAULT: colors.emerald[500],
          hover: colors.emerald[600],
          focus: colors.emerald[500],
          disabled: colors.emerald[300],
        },
        info: {
          DEFAULT: colors.blue[500],
        },
        "info-txt": {
          DEFAULT: colors.blue[500],
          secondary: colors.blue[400],
        },
        "info-bg": {
          DEFAULT: colors.blue[50],
          hover: colors.blue[100],
        },
        "info-btn": {
          DEFAULT: colors.blue[500],
          hover: colors.blue[600],
          focus: colors.blue[500],
          disabled: colors.blue[300],
        },
        warning: {
          DEFAULT: colors.amber[500],
        },
        "warning-txt": {
          DEFAULT: colors.amber[600],
          secondary: colors.amber[500],
        },
        "warning-bg": {
          DEFAULT: colors.amber[50],
          hover: colors.amber[100],
        },
        "warning-btn": {
          DEFAULT: colors.amber[500],
          hover: colors.amber[600],
          focus: colors.amber[500],
          disabled: colors.amber[300],
        },
        danger: {
          DEFAULT: colors.red[500],
        },
        "danger-txt": {
          DEFAULT: colors.red[500],
          secondary: colors.red[300],
        },
        "danger-border": {
          DEFAULT: colors.red[400],
        },
        "danger-bg": {
          DEFAULT: colors.red[50],
          hover: colors.red[100],
        },
        "danger-btn": {
          DEFAULT: colors.red[500],
          hover: colors.red[600],
          focus: colors.red[500],
          disabled: colors.red[300],
        },
      },
    },
  },
  plugins: [
    plugin(({ addVariant }) =>
      addVariant("phx-no-feedback", ["&.phx-no-feedback", ".phx-no-feedback &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [
        "&.phx-click-loading",
        ".phx-click-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [
        "&.phx-submit-loading",
        ".phx-submit-loading &",
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [
        "&.phx-change-loading",
        ".phx-change-loading &",
      ])
    ),
    plugin(function ({ matchComponents, theme }) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized");
      let values = {};
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"],
      ];
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach((file) => {
          let name = path.basename(file, ".svg") + suffix;
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) };
        });
      });
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            let content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, "");
            let size = theme("spacing.6");
            if (name.endsWith("-mini")) {
              size = theme("spacing.5");
            } else if (name.endsWith("-micro")) {
              size = theme("spacing.4");
            }
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              "-webkit-mask": `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              "mask-repeat": "no-repeat",
              "background-color": "currentColor",
              "vertical-align": "middle",
              display: "inline-block",
              width: size,
              height: size,
            };
          },
        },
        { values }
      );
    }),
  ],
};
