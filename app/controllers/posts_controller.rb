class PostsController < ApplicationController
    def index
        render layout: false
    end
    def create
        post = Post.new(tweet_params)
        post.user_id = current_user.id
        post.save
        redirect_back(fallback_location: root_path)
    end
    def destroy
        post = Post.find(params[:id])
        post.discard
        redirect_back(fallback_location: root_path)
    end
    def done
        require "date"
        @today = Date.today #今日の日付
        post = Post.find(params[:id])
        post.update(done_at: @today ) #完了ボタンを押すとdone_atカラムに完了した日時を追加
        redirect_back(fallback_location: root_path)
    end
    def restoration
        require "date"
        @today = Date.today #今日の日付
        post = Post.find(params[:id])
        post.update(done_at:nil)
        redirect_back(fallback_location: root_path)
    end
    private
    def tweet_params
        params.require(:post).permit(:body, :time, :done_at)
    end
end
