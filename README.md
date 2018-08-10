# cypress-ts-memory-leak
Reproduction Repo where using typescript with cypress causes an out-of-memory error

## Running Tests
```bash
$ yarn
$ yarn test
```

Around the 37th test, you should get an out of memory exception similar to

```
────────────────────────────────────────────────────────────────────────────────────────────────────

  Running: test42.ts...                                                                  (37 of 50)

<--- Last few GCs --->

[21977:0x7f94ab01b200]   151789 ms: Mark-sweep 2059.6 (2165.2) -> 2059.6 (2149.2) MB, 4886.1 / 0.0 ms  (+ 0.0 ms in 0 steps since start of marking, biggest step 0.0 ms, walltime since start of marking 4886 ms) last resort
[21977:0x7f94ab01b200]   156632 ms: Mark-sweep 2059.6 (2149.2) -> 2059.6 (2149.2) MB, 4842.6 / 0.0 ms  last resort



<--- JS stacktrace --->

==== JS stack trace =========================================

Security context: 0x2dfba37ad681 <JSObject>
    1: set [native collection.js:~247] [pc=0x928742bfdb4](this=0x28257ee942c9 <Map map = 0x44554988609>,p=0x1f93fc19e4f1 <String[13]: MSDescription>,x=0x1587c7882bf1 <SymbolObject map = 0x1f792a0791b1>)
    3: /* anonymous */(aka /* anonymous */) [/Users/thomasladd/github/cypress-ts-memory-leak/node_modules/typescript/lib/typescript.js:30020] [bytecode=0x3ff4e4d20bf9 offset=65](this=0x34f120f023...

FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory
 1: node::Abort() [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 2: node::FatalError(char const*, char const*) [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 3: v8::internal::FatalProcessOutOfMemory(char const*) [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 4: v8::internal::FatalProcessOutOfMemory(char const*) [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 5: v8::internal::Factory::NewFixedArray(int, v8::internal::PretenureFlag) [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 6: v8::internal::compiler::Node::Uses::empty() const [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 7: v8::internal::RegisterConfiguration::AreAliases(v8::internal::MachineRepresentation, int, v8::internal::MachineRepresentation, int) const [/Users/thomasladd/Library/Caches/Cypress/3.0.3/Cypress.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries/libnode.dylib]
 8: 0x92873d043fd
 9: 0x928742bfdb4
10: 0x92873df78ea
11: 0x92873dbbe1c
```

## Modifying Tests
If you want to modify the test content, you can edit test1.ts, and then run `yarn copyTest1`, which will copy test1.ts's contents to every other test file.
