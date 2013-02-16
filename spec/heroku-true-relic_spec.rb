require 'spec_helper'

describe HerokuTrueRelic, :type => :feature do
  describe Dummy::Application do
    subject { Rails.application }
    it { should be_a_kind_of Dummy::Application }
  end

  describe 'queue time headers' do
    def to_millis(time)
      (time.to_f * 1_000).to_i
    end

    let!(:request_start) { Time.at(Time.now.utc.to_i).utc }
    let(:request_start_ms) { to_millis(request_start) }
    let(:queue_time) { 1.second }
    let(:queue_time_ms) { to_millis(queue_time) }
    let(:request_receive_time) { request_start + queue_time }

    let(:port) { 5671 }
    let(:uri) { URI.parse "http://localhost:#{port}/env/#{env_var}" }
    let(:res) do
      req = Net::HTTP::Get.new(uri.request_uri)
      req['X-Request-Start'] = request_start_ms
      res = Net::HTTP.start(uri.hostname, uri.port) {|http| http.request(req) }
    end

    before do
      Timecop.freeze(request_receive_time)
      Capybara::Server.new(Rails.application, port).boot
    end

    after do
      Timecop.return
    end

    subject { res.body }

    describe 'HTTP_X_QUEUE_TIME' do
      let(:env_var) { "HTTP_X_QUEUE_TIME" }
      it { should == "t=#{queue_time_ms * 1_000}" }
    end

    describe 'HTTP_X_MIDDLEWARE_START' do
      let(:env_var) { 'HTTP_X_MIDDLEWARE_START' }
      it { should == "t=#{to_millis(request_receive_time) * 1_000}" }
    end
  end
end
