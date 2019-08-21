#!binbash

version=$1
text=$2
branch=$(git rev-parse --abbrev-ref HEAD)
repo_full_name=$(git config --get remote.origin.url | sed 's/.*:\/\/github.com\///;s/.git$//')
repo_name=$(git config --get remote.origin.url | sed 's/.*\///')
token=$(git config --global github.token)

generate_post_data()
{
  cat <<EOF
{
  "tag_name": "$version",
  "target_commitish": "$branch",
  "name": "$version",
  "body": "$text",
  "draft": false,
  "prerelease": false
}
EOF
}

echo "Create release $version for repo: $repo_full_name branch: $branch"
releaseid=$(curl --data "$(generate_post_data)" "https://api.github.com/repos/$repo_full_name/releases?access_token=$token" | grep '^  \"id\"' | sed -r  's/^[^0-9]*([0-9]+).*/\1/')

echo "Create archive"
"/c/Program Files (x86)/7-Zip/7z.exe" a -tzip "$repo_name.zip" . -xr\!src -xr\!.git

curl -XPOST -H "Authorization:token $token" -H "Content-Type:application/octet-stream" --data-binary @"$repo_name.zip" "https://uploads.github.com/repos/$repo_full_name/releases/$releaseid/assets?name=$repo_name.zip"

rm "$repo_name.zip"