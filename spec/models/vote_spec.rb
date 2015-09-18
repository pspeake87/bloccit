require 'rails_helper'

describe Vote do
  describe "validations" do

    before do
      @post = Post.create(title: 'post title', body: 'post body Post bodies must be pretty long.')
      @post.votes.create(value: 1)
      @post.votes.create(value: -1)
      @post.votes.create(value: 3)
      @post.votes.create(value: -3)
    end

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect( @post.up_votes ).to eq(1)
        expect( @post.down_votes ).to eq(1)
      end
    end
  end
end