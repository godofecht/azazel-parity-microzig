# azazel-parity-microzig

[microzig](https://github.com/ZigEmbeddedGroup/microzig)'s `flags` parser
(`tools/flags`, std-only) built two ways, to prove and compare
[azazel](https://github.com/godofecht/azazel) and
[zaza](https://github.com/godofecht/zaza).

Both build a consumer that parses `--name=zaza` into a `Flags` struct, on Zig
`0.17.0-dev.892` (microzig's toolchain family). azazel reaches it through its
`"0.17"` lane. Neither vendors microzig's source; each stages the single
`tools/flags/src/root.zig` file at a pinned commit.

## Pinned upstream

| | |
|---|---|
| Repository | https://github.com/ZigEmbeddedGroup/microzig |
| Commit | `aabcd3e1824adac6aa3feca8023d50ee0ccbf8fc` |
| File | `tools/flags/src/root.zig` |
| Zig | `0.17.0-dev.892+54537285c` |

## Build it

```sh
cd azazel && ./fetch.sh && sh gen_build_spec.sh && zig build && ./zig-out/bin/consumer
cd zaza  && ./fetch.sh && zig build run
```

Both print `microzig flags: name=zaza verbose=false`.

## Comparison

| Build | What it does | Config size |
|-------|--------------|-------------|
| azazel | imports the flags module + a consumer, as CUE data on the 0.17 lane | `project.cue`, 14 lines |
| zaza | imports the flags module via the standard Zig build graph | `build.zig`,       13 lines |
