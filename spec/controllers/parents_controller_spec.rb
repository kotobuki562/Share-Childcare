require 'rails_helper'

RSpec.describe ParentsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET new" do
    let(:parent) { create(:parent) }
    context "log in" do
      before do
        login user
        get :new
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :new
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:parent)).to be_a_new(Parent)
      end
    end
  end

  describe "POST create" do
    let(:parent) { create(:parent) }
    let(:parent_attributes){ attributes_for(:parent) }
    context "log in" do
      before do
        login user
        post :create, params: { parent: parent_attributes }
      end
      it "Viewに推移する事を確認" do
        parent = Parent.last
        expect(response).to redirect_to(parent_path(parent.id))
      end
      it "モデルの増減することを確認" do
        expect{ post :create, params: { parent: parent_attributes }}.to change(Parent, :count).by(1)
      end
    end
  end

  describe "GET edit" do
    context "log in" do
      let(:parent) { create(:parent, user_id: user.id)}
      before do
        login user
        get :edit, params: { id: parent, user_id: user.id }
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :edit
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:parent)).to eq parent
      end
    end
  end

  describe "PATCH update" do
    let!(:parent) { create(:parent) }
    let(:update_attributes) do
      {
        order_money_option: 3
      }
    end
    context "log in" do
      before do
        login user
        patch :update, params: { id: parent, parent: update_attributes }
      end
      it "モデルの増減しないことを確認" do
        expect{ patch :update, params: { id: parent, parent: update_attributes }}.to change(Parent, :count).by(0)
      end
      it "Viewに推移する事を確認" do
        parent = Parent.last
        expect(response).to redirect_to(parent_path(user_id: parent.user_id))
      end
    end
  end

  describe "GET show" do
    context "log in" do
      let(:parent) { create(:parent, user_id: user.id) }
      before do
        login user
        get :show, params: { id: parent.id, user_id: user.id}
      end
      it "HTTPステータスが200であることを確認" do
        expect(response.status).to eq(200)
      end
      it "Viewに推移する事を確認" do
        expect(response).to render_template :show
      end
      it "インスタンス変数を確認する" do
        expect(assigns(:parent)).to eq parent
      end
    end
  end
end





