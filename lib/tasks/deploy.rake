task PRODUCTION = "homespree" # "task" here stubs to prevent rake errors with commandline
task STAGING = "homespree-staging"

APP = ARGV[1] || STAGING

puts "=== APP #{APP} ==="
puts <<-HOMESPREE


        `:oshdy`  .hdd:
      -yh:.hmm/   /mmd`
     :my` /mmd`  `hmm+                                                     ---
    `sN/ `ymms.../mmd.  `/shyys.  `syy++yhy+`:shhs.    .oyyoyo`  `smmm.   smmhoshho.  /yyo:oyy.  :shssy:  `:shssy-
     `:- -mmdysssdmms  /dmh- -mh``/mmmo-/ddmh:-ymmo  `omms` ym.  /ddmm-  .mmm+` ommy .mmms--hd-.hmd: .my -dmd: .m+
        `smms   -mmd- /mmd.  +md++dmmo  /mmd. `ymm: `ommy``od:  /+-dmm:  +mmy`  +mmy /mmh`    .dmm: -yy`-dmd: -hs`
        .mmm-   smmy .dmm+   -No .mmm:  hmmo  :mmh` -mdmy+o:` `+s``hmm+ `dmm/   ymm+`hmm+     ommdoo+-  ymmd+o+.
        ommh   .dmm: .mmm:  -dh``smms  :mmd. `smm/  omdd.    .hh+``ymms:ymmh` `+mmh`:mmd.    `ymmo    `:ddms   ``
       .dmm:   ommh` `ymmhsydo` .dmm/  smms` `smmhsyoymmho+oo/ss++ymmy/.hmmdoohmds` hmms      /mmms+ooo-ommmysyo
       .//:    ::/-    .///:`   ./::` `::/.    -//:`  -///:`   .///:`  /mmd-://:`  `::/`       `:///-`   .///:`
                                                                      `ymms`
                                                                      -mmm.    ---> #{Rails.env.to_s.upcase} <---
                                                                      -/-`

HOMESPREE


namespace :deploy do
  task :migrations => [:push, :off, :migrate, :restart, :on]

  task :production => [:precompile_assets, :push, :restart, :tag]

  task :staging_migrations => [:set_staging_app, :push, :off, :migrate, :restart, :on, :tag]
  task :staging_rollback => [:set_staging_app, :off, :push_previous, :restart, :on]

  task :production_migrations => [:set_production_app, :push, :off, :migrate, :restart, :on, :tag]
  task :production_rollback => [:set_production_app, :off, :push_previous, :restart, :on]


  task :precompile_assets do
    puts "Precompiling assets for #{APP}"
    puts `rake assets:precompile`
  end

  task :push do
    puts 'Deploying site to Heroku ...'
    puts `git push git@heroku.com:#{APP}.git master`
  end

  task :restart do
    puts 'Restarting app servers ...'
    puts `heroku restart --app #{APP}`
  end

  task :tag do
    release_name = "#{APP}_release-#{Time.now.utc.strftime("%Y-%m-%d_%H-%M-%S")}"
    puts "Tagging release as '#{release_name}'"
    puts `git tag -a #{release_name} -m 'Tagged release'`
    puts `git push --tags git@heroku.com:#{APP}.git master`
  end

  task :migrate do
    puts 'Running database migrations ...'
    puts `heroku rake db:migrate --app #{APP}`
  end

  task :off do
    puts 'Putting the app into maintenance mode ...'
    puts `heroku maintenance:on --app #{APP}`
  end

  task :on do
    puts 'Taking the app out of maintenance mode ...'
    puts `heroku maintenance:off --app #{APP}`
  end

  task :push_previous do
    prefix          = "#{APP}_release-"
    releases        = `git tag`.split("\n").select { |t| t[0..prefix.length-1] == prefix }.sort
    current_release = releases.last
    previous_release = releases[-2] if releases.length >= 2
    if previous_release
      puts "Rolling back to '#{previous_release}' ..."

      puts "Checking out '#{previous_release}' in a new branch on local git repo ..."
      puts `git checkout #{previous_release}`
      puts `git checkout -b #{previous_release}`

      puts "Removing tagged version '#{previous_release}' (now transformed in branch) ..."
      puts `git tag -d #{previous_release}`
      puts `git push git@heroku.com:#{APP}.git :refs/tags/#{previous_release}`

      puts "Pushing '#{previous_release}' to Heroku master ..."
      puts `git push git@heroku.com:#{APP}.git +#{previous_release}:master --force`

      puts "Deleting rollbacked release '#{current_release}' ..."
      puts `git tag -d #{current_release}`
      puts `git push git@heroku.com:#{APP}.git :refs/tags/#{current_release}`

      puts "Retagging release '#{previous_release}' in case to repeat this process (other rollbacks)..."
      puts `git tag -a #{previous_release} -m 'Tagged release'`
      puts `git push --tags git@heroku.com:#{APP}.git`

      puts "Turning local repo checked out on master ..."
      puts `git checkout master`
      puts 'All done!'
    else
      puts "No release tags found - can't roll back!"
      puts releases
    end
  end
end


namespace :app do
  task :logs do
    puts "tailing logs..."
    system("heroku logs --tail --app #{APP}")
  end

  task :config do
    puts "config..."
    system("heroku config --app #{APP}")
  end

  task :ps do
    puts "running processes..."
    system("heroku ps --app #{APP}")
  end

  task :releases do
    puts "releases..."
    system("heroku releases --app #{APP}")
  end
end