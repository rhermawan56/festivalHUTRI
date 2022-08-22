class PostsController < ApplicationController
    before_action :must_login

    def posts_form
        session[:post] = "active"
        session[:home] = nil
        session[:login] = nil
        session[:signup] = nil
        @posts = Post.new
    end

    def post
        @all = Post.all.last
        if @all == nil
            @last = 1
        else
            @last = @all.id + 1
        end

        if params[:image] != ''
            image = params[:image]

            @posts = Post.new(
                user_id: @current_user.id,
                content: params[:content],
                user_images: "#{@last}.jpg"
            )

            if @posts.save
                flash[:notice] = "Upload berhasil"
                image = params[:image]
                File.binwrite("public/content_images/#{@last}.jpg", image.read)
                redirect_to("/home")
            else
                flash[:notice] = "Semua kolom harus diisi"
                render("posts/posts_form")
            end

        else
            @posts = Post.new
            flash[:notice] = "Gambar harus di upload"
            render("posts/posts_form")
        end
    end

    def edit
        @posts = Post.find_by(id: params[:id])
    end
    
    def update
        @posts = Post.find_by(id: params[:id])
        @posts.content = params[:content]
    
       if @posts.save
            if params[:images] != ''
                image = params[:image]
                File.binwrite("public/content_images/#{@posts.user_images}", image.read)
            end
            flash[:notice] = "Berhasil memperbarui"
            redirect_to("/home")
        else
            render("posts/edit")
        end
    end

    def destroy
        Post.destroy_by(id: params[:id])
        flash[:notice] = "Berhasil menghapus post"
        redirect_to("/home")
    end
end
