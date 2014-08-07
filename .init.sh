bundle check 1>/dev/null

if [ $? -ne 0 ]; then
  if [ -d "./vendor/bundle" ]; then
    rm -rf vendor/bundle;
  fi

  bundle install --path vendor/bundle --binstubs --clean
fi
