if [ -d /etc/supervisor/load.d ]; then
  for i in /etc/supervisor/load.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

/usr/bin/supervisord -n -e debug  -c /etc/supervisord.conf
