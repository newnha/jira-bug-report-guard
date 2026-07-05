#!/bin/bash
input=$(cat)
file_path=$(echo "$input" | jq -r '.tool_input.file_path')
content=$(echo "$input" | jq -r '.tool_input.content')

if [[ "$file_path" != *bug-report.md ]]; then
  exit 0
fi

extract_value() {
  # $1 = 필드명, $2 = 원본 content
  echo "$2" | grep -oE "^$1[[:space:]]*:.*" | head -1 \
    | sed -E "s/^$1[[:space:]]*:[[:space:]]*//" \
    | awk '{print $1}'
}

errors=()

phase=$(extract_value "Phase" "$content")
if [[ -n "$phase" ]] && ! [[ "$phase" =~ ^(DEV|SANDBOX|CBT|PRODUCTION)$ ]]; then
  errors+=("Phase 값이 허용 목록(DEV/SANDBOX/CBT/PRODUCTION)에 없습니다: ${phase}")
fi

priority=$(extract_value "Priority" "$content")
if [[ -n "$priority" ]] && ! [[ "$priority" =~ ^(Highest|High|Medium|Low|Lowest)$ ]]; then
  errors+=("Priority 값이 허용 목록(Highest/High/Medium/Low/Lowest)에 없습니다: ${priority}")
fi

severity=$(extract_value "Severity" "$content")
if [[ -n "$severity" ]] && ! [[ "$severity" =~ ^(Critical|Major|Minor|Trivial)$ ]]; then
  errors+=("Severity 값이 허용 목록(Critical/Major/Minor/Trivial)에 없습니다: ${severity}")
fi

frequency=$(extract_value "Frequency" "$content")
if [[ -n "$frequency" ]] && ! [[ "$frequency" =~ ^(Always|Often|Sometimes|Rarely)$ ]]; then
  errors+=("Frequency 값이 허용 목록(Always/Often/Sometimes/Rarely)에 없습니다: ${frequency}")
fi

if [[ ${#errors[@]} -gt 0 ]]; then
  printf '%s\n' "${errors[@]}" >&2
  exit 2
fi

exit 0
