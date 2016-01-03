# Contributing
See a bug or typo? Have an idea? Just do the following:

* Write a detailed description of what you're adding in the pull request
  (screenshots help).
* Submit the pull request to the `master` branch.

## Development
1. In your projects folder, clone this repo: `git clone git@github.com:sushiandrobots/themixinsf.com.git`.
2. Move into your directory: `cd themixinsf.com`.
3. If you don't have bundler yet, install it: `gem install bundler`.
4. Install ruby gems: `bundle install`.
5. Run the server: `middleman server`. View in the browser at: `http://localhost:4567/`.
6. Run `middleman build` to build a static site.
7. To deploy to the public site, run `middleman deploy --build-before`.

## Resources
* [Middleman](https://middlemanapp.com/) -- the static site generator we use.
* [Sass](http://sass-lang.com) -- CSS preprocessor

## Directories
* `/source` -- source files
* `/data` -- data stored as yaml or json
* `/helpers` -- where you can store ruby helpers
* `/build` -- the built files you get after running `middleman build`

Thanks!
