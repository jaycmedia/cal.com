// This configuration only applies to the package manager root.
/** @type {import("eslint").Linter.Config} */
module.exports = {
  extends: ["./packages/config/eslint-preset.js"],
  rules: {
    '@calcom/eslint/avoid-web-storage': 'off',
  },
};
