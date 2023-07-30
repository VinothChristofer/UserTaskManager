require "spec_helper"

describe TasksController, type: :controller do

  before(:each) do 
    allow_any_instance_of(TasksController).to receive(:authenticate_user!).and_return(true) 
    # allow_any_instance_of(TasksController).to receive(:current_user_id).and_return(Task.find_by(title: "task1").id) 
  end

  after(:each) do 
      TasksController.any_instance.unstub(:authenticate_user!)
  end

  after(:all) do 
      puts "Runs after all tests are run" 
      Task.where(title: "task1").destroy_all
  end

  context "create" do
      it "should create and get an Task" do
          request.headers['Content-Type'] = 'application/json'
          request.headers['Accept'] = 'application/json'
          post :create, params: {task:{"title": "task1","body": "KT with Omid"}}
          expect(response.status).to eq(201)
          Task = Task.find_by(title: "task1")
      end
  end

  context "get" do
      it "should get all available Tasks" do
          request.headers['Content-Type'] = 'application/json'
          request.headers['Accept'] = 'application/json'
          get :index
          expect(response.status).to eq(200)
      end

      it "should get Task by index" do
          Task = Task.create(title: "task1", "body": "KT with Omid")
          get :show, params: {id: Task.id}
          expect(response.status).to eq(200)
      end
  end

#   context "edit" do
#       it "should edit specific Tasks" do
#           request.headers['Content-Type'] = 'application/json'
#           request.headers['Accept'] = 'application/json'
#           Task = Task.create(title: "task1", "body": "KT with Omid")
#           patch :update, params: {"id": Task.id, Task:{"title": "task1","body": "KT with Omid and team"}}
#           expect(response.status).to eq(200)
#           updated_Task = Task.find(Task.id)
#           expect(updated_Task.body).to eq("KT with Omid and team")
#       end
#   end
end
