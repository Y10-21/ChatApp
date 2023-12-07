require 'rails_helper'

RSpec.describe Message,type :model do
  before  do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimgがあれば保存できる' do
        expect(@message).to be_valid
      end
      it 'コンテンツがからでも保存できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
      it '画像がからでも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    content 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.error.full_message).to include("Content can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.error.full_message).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.error.full_message).to include('User must exist')
      end
    end
  end
end
