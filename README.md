# Find and Replace Character

A Google Tag Manager variable template for both web and server containers that finds a specific character in a string and replaces it with another character, or removes it entirely if no replacement is specified.

## Overview

This template provides a simple way to find and replace (or remove) single characters in strings. It's useful for sanitizing data, reformatting values, or fixing character issues before sending data to analytics platforms.

## Installation

1. In your GTM container (web or server-side), go to **Templates** → **Variable Templates** → **Search Gallery**
2. Search for "Find and Replace Character"
3. Click **Add to workspace**

## Configuration

| Field | Description |
|-------|-------------|
| **Input String** | The string to process |
| **Find Character** | The character to find and replace |
| **Replace With** | The replacement character (leave empty to remove) |

## Examples

| Input | Find | Replace | Output |
|-------|------|---------|--------|
| `test.value.here` | `.` | `_` | `test_value_here` |
| `test.value.here` | `.` | *(empty)* | `testvaluehere` |
| `hello world` | ` ` | `-` | `hello-world` |
| `a,b,c,d` | `,` | `;` | `a;b;c;d` |
| `some-kebab-case` | `-` | `_` | `some_kebab_case` |
| `123.456` | `.` | `,` | `123,456` |

## Use Cases

### 1. Sanitize Field Names for Key-Value Stores

Some stores (like Firestore, Stape Store) interpret dots as nested object paths. Replace dots to prevent issues:

- **Find:** `.`
- **Replace:** `_`
- **Input:** `group_693ac1c9ac9a98.02295397`
- **Output:** `group_693ac1c9ac9a98_02295397`

### 2. Format Decimal Numbers for Different Locales

Convert decimal separator from dot to comma:

- **Find:** `.`
- **Replace:** `,`
- **Input:** `1234.56`
- **Output:** `1234,56`

### 3. Convert Spaces to URL-Safe Characters

- **Find:** ` ` (space)
- **Replace:** `-`
- **Input:** `my product name`
- **Output:** `my-product-name`

### 4. Remove Unwanted Characters

Leave "Replace With" empty to remove characters:

- **Find:** `.`
- **Replace:** *(empty)*
- **Input:** `test.value`
- **Output:** `testvalue`

### 5. Convert Case Styles

Convert kebab-case to snake_case:

- **Find:** `-`
- **Replace:** `_`
- **Input:** `my-variable-name`
- **Output:** `my_variable_name`

## Notes

- This template replaces **single characters**, not strings
- All occurrences of the character are replaced
- If the find character is not found, the original string is returned
- If input is `undefined` or `null`, returns `undefined`
- Numeric inputs are automatically converted to strings

## Compatibility

This template works in both:
- **Web GTM** containers
- **Server-side GTM** containers

## Author

**Metryx Studio**  
Website: [metryx.studio](https://metryx.studio)  
Contact: filip@metryx.studio

## License

Apache License 2.0
