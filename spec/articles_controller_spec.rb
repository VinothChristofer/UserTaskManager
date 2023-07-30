require "spec_helper" 
describe ArticlesController, type: :controller do
    before(:each) do 
        allow_any_instance_of(ArticlesController).to receive(:authenticate_user!).and_return(true) 
    end

    after(:each) do 
        ArticlesController.any_instance.unstub(:authenticate_user!)
    end

    after(:all) do 
        puts "Runs after all tests are run" 
        Article.where(title: "Break up post").destroy_all
    end

    context "create" do
        it "should create and get an Article" do
            request.headers['Content-Type'] = 'application/json'
            request.headers['Accept'] = 'application/json'
            post :create, params: {article:{"title": "Break up post","body": "sucks way too much!!"}}
            expect(response.status).to eq(201)
            article = Article.find_by(title: "Break up post")
        end
    end

    context "get" do
        it "should get all available Articles" do
            request.headers['Content-Type'] = 'application/json'
            request.headers['Accept'] = 'application/json'
            get :index
            expect(response.status).to eq(200)
        end

        it "should get article by index" do
            article = Article.create(title: "Break up post", "body": "edhuku indha vivareedham")
            get :show, params: {id: article.id}
            expect(response.status).to eq(200)
        end
    end

    context "edit" do
        it "should edit specific Articles" do
            request.headers['Content-Type'] = 'application/json'
            request.headers['Accept'] = 'application/json'
            article = Article.create(title: "Break up post", "body": "edhuku indha vivareedham")
            patch :update, params: {"id": article.id, article:{"title": "Break up post","body": "sucks not too much!!"}}
            expect(response.status).to eq(200)
            updated_article = Article.find(article.id)
            expect(updated_article.body).to eq("sucks not too much!!")
        end
    end
end

# RSpec.describe UsersController do
#     describe "GET index" do
#       it "assigns @users" do
#         team = Team.create
#         get :index
#         expect(assigns(:teams)).to eq([team])
#       end
#        it "renders the index template" do
#         get :index
#         expect(response).to render_template("index")
#       end
#     end
#   end
 