class UsersController < ApplicationController
    def show
        require "date"
        @today = Date.today
        @task =Post.new
        @user = User.find(params[:id])
        @tweets = @user.posts.where(done_at:nil).order(:time) 
        @tweets_done = @user.posts.where.not(done_at:nil) 

            @user_discarded_posts = @tweets_done
            @totalExp =  @user_discarded_posts.count
            @user.experience_point = @totalExp
            @user.save!
            levelSetting = LevelSetting.find_by(level: @user.level + 1);
            if levelSetting&.thresold.to_i <= @user.experience_point
                @user.level  += 1 if levelSetting
                @user.save!
            end
            # @user_undiscarded_posts = @user.posts.undiscarded
            # @totalExp =  @user_undiscarded_posts.count
            # @user.experience_point = @totalExp
            # @user.save!
            # levelSetting = LevelSetting.find_by(level: @user.level - 1);
            # if levelSetting&.thresold.to_i <= @user.experience_point
            # # &はlevelsettingがnilだったときに、nilとしてだす=>nilという文字をinteger型に変換する
            #     @user.level  -= 1 if levelSetting
            #     # levelSettingがtrueだった時に、上のコードが実行される。つまり、nilの時はfalseで0として変換されるので、上のコードは実行されない。
            #     @user.save!
            # end

    end
    protected
    def after_destroy_path_for(resource)
        redirect_to user_path(current_user)
    end
end
