___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "MACRO",
  "id": "find_and_replace_character",
  "version": 1,
  "securityGroups": [],
  "displayName": "Find and Replace Character",
  "description": "Finds a specific character in a string and replaces it with another character, or removes it entirely if no replacement is specified.",
  "containerContexts": [
    "SERVER",
    "WEB"
  ],
  "categories": ["UTILITY"],
  "brand": {
    "id": "metryxstudio",
    "displayName": "Metryx Studio"
  }
}

___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "inputValue",
    "displayName": "Input String",
    "simpleValueType": true,
    "help": "The string to process. Use a variable like {{Event Data - value}}."
  },
  {
    "type": "TEXT",
    "name": "findCharacter",
    "displayName": "Find Character",
    "simpleValueType": true,
    "help": "The character to find and replace (e.g., dot, comma, space)."
  },
  {
    "type": "TEXT",
    "name": "replaceWith",
    "displayName": "Replace With",
    "simpleValueType": true,
    "help": "The replacement character. Leave empty to remove the character entirely."
  }
]

___SANDBOXED_JS_FOR_SERVER___

var makeString = require('makeString');

var input = data.inputValue;
var findChar = data.findCharacter;
var replaceWith = data.replaceWith || '';

if (input === undefined || input === null) {
  return undefined;
}

if (!findChar) {
  return makeString(input);
}

var str = makeString(input);
var result = '';

for (var i = 0; i < str.length; i++) {
  if (str[i] === findChar) {
    result += replaceWith;
  } else {
    result += str[i];
  }
}

return result;


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var makeString = require('makeString');

var input = data.inputValue;
var findChar = data.findCharacter;
var replaceWith = data.replaceWith || '';

if (input === undefined || input === null) {
  return undefined;
}

if (!findChar) {
  return makeString(input);
}

var str = makeString(input);
var result = '';

for (var i = 0; i < str.length; i++) {
  if (str[i] === findChar) {
    result += replaceWith;
  } else {
    result += str[i];
  }
}

return result;



___WEB_PERMISSIONS___

[]


___SERVER_PERMISSIONS___

[]


___TESTS___

scenarios:
- name: Replace dot with underscore
  code: |-
    const mockData = {
      inputValue: 'group_693ac1c9ac9a98.02295397',
      findCharacter: '.',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('group_693ac1c9ac9a98_02295397');
- name: Replace multiple dots
  code: |-
    const mockData = {
      inputValue: 'test.value.with.dots',
      findCharacter: '.',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('test_value_with_dots');
- name: Remove character (empty replacement)
  code: |-
    const mockData = {
      inputValue: 'test.value.with.dots',
      findCharacter: '.',
      replaceWith: ''
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('testvaluewithdots');
- name: Replace space with hyphen
  code: |-
    const mockData = {
      inputValue: 'hello world test',
      findCharacter: ' ',
      replaceWith: '-'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('hello-world-test');
- name: Replace comma with semicolon
  code: |-
    const mockData = {
      inputValue: 'a,b,c,d',
      findCharacter: ',',
      replaceWith: ';'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('a;b;c;d');
- name: Remove spaces
  code: |-
    const mockData = {
      inputValue: 'hello world',
      findCharacter: ' ',
      replaceWith: ''
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('helloworld');
- name: No match found
  code: |-
    const mockData = {
      inputValue: 'no_dots_here',
      findCharacter: '.',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('no_dots_here');
- name: Undefined input returns undefined
  code: |-
    const mockData = {
      inputValue: undefined,
      findCharacter: '.',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo(undefined);
- name: Null input returns undefined
  code: |-
    const mockData = {
      inputValue: null,
      findCharacter: '.',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo(undefined);
- name: Empty find character returns original
  code: |-
    const mockData = {
      inputValue: 'test.value',
      findCharacter: '',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('test.value');
- name: Numeric input converted to string
  code: |-
    const mockData = {
      inputValue: 123.456,
      findCharacter: '.',
      replaceWith: ','
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('123,456');
- name: Replace hyphen with underscore
  code: |-
    const mockData = {
      inputValue: 'some-kebab-case',
      findCharacter: '-',
      replaceWith: '_'
    };
    let result = runCode(mockData);
    assertThat(result).isEqualTo('some_kebab_case');
