# notif shows GitHub notifications

local notifs=$(
gh api \
  -H 'Accept: application/vnd.github+json' \
  '/notifications' \
  --jq '.[] | .subject.title'
)

if [[ -z $notifs ]]; then
  echo 'No notifications'
else
  echo $notifs
fi
