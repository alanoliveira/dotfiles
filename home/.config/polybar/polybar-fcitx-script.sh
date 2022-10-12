current() {
  local name=$(dbus-send --session --print-reply=literal \
    --dest=org.fcitx.Fcitx "/inputmethod" "org.fcitx.Fcitx.InputMethod.GetCurrentIM")
  if [[ -z "$name" ]]; then
    return
  fi
  echo $name
}

print_pretty_name() {
  local name=$(current)
  if [[ $name == "mozc" ]]; then
    echo "jp"
  else
    echo "us"
  fi
}

react() {
  # Without this, Polybar will display empty
  # string until you switch input method.
  print_pretty_name

  # Track input method changes. Each new line read is an event fired from IM switch
  while true; do
    # When read someting from dbus-monitor
    read -r unused
    print_pretty_name
  done
}

dbus-monitor --session interface=org.freedesktop.DBus.Properties member=PropertiesChanged | grep --line-buffered 'PropertiesChanged' | react
