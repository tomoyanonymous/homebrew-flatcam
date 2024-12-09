## How to update the version.

I can not actively watch this repository, so if you encountered errors, try to update formula first before asking.

First, you can edit this tap formula on your environment.

The repository is located on these places.

(arm64 architecture)

```sh
open /opt/homebrew/Library/Taps/tomoyanonymous/homebrew-flatcam/
```

(x86 architecture if you use Rosetta version)

```sh
open /usr/local/Homebrew/Library/Taps/tomoyanonymous/homebrew-flatcam/
```

For example, if you want to fix the `flatcam-evo` formula to the latest commit, replace the value of `revision` on the `url` line in the formula file `flatcam-evo.rb`. 

```ruby
url "https://bitbucket.org/marius_stanciu/flatcam_beta.git", branch: "Beta_8.995", revision: "1ef01840d00eaad9dbd906832911ef63c0748625" # <-this value
```

to the latest commit hash, refering to the repositry.

https://bitbucket.org/marius_stanciu/flatcam_beta/commits/branch/Beta_8.995

If you tested on `brew reinstall flatcam-evo --debug --verbose` without any problems, you can open PR to merge your fix to this repo.

First, [fork this repository on your account](https://docs.github.com/ja/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo).

Change directory on the tap repo.

```sh
cd /opt/homebrew/Library/Taps/tomoyanonymous/homebrew-flatcam/`
```
Add to your repo to remote repositroy.

```sh
git remote add downstream git@github.com/{your_account_name}/homebrew-flatcam.git
```

And commit your change and push it to your repo.

```sh
git add .
git commit -m "updated flatcam-evo to latest version"
git push downstream master
```

...[and open the PR](https://docs.github.com/ja/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork).

If you could not build the latest version and can not ivestigate the cause, you can ask on issue. However, I can not always respond immediately. Please do help each other!