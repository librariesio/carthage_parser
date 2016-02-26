require_relative 'spec_helper'

describe "parsing endpoints" do
  it "should successfully parse Carthfile" do
    path = File.expand_path("../fixtures/Carthfile", __FILE__)
    file = File.open(path).read
    post '/carthfile', body: file
    last_response.body.must_include "[{\"name\":\"ReactiveCocoa/ReactiveCocoa\",\"version\":\">=2.3.1\",\"type\":\"runtime\"},{\"name\":\"Mantle/Mantle\",\"version\":\"~>1.0\",\"type\":\"runtime\"},{\"name\":\"jspahrsummers/libextobjc\",\"version\":\"==0.4.1\",\"type\":\"runtime\"},{\"name\":\"jspahrsummers/xcconfigs\",\"version\":\"\",\"type\":\"runtime\"},{\"name\":\"jspahrsummers/xcconfigs\",\"version\":\"branch\",\"type\":\"runtime\"},{\"name\":\"https://enterprise.local/ghe/desktop/git-error-translations\",\"version\":\"\",\"type\":\"runtime\"},{\"name\":\"https://enterprise.local/desktop/git-error-translations2.git\",\"version\":\"development\",\"type\":\"runtime\"},{\"name\":\"file:///directory/to/project\",\"version\":\"branch\",\"type\":\"runtime\"}]"
  end

  it "should successfully parse Carthfile.private" do
    path = File.expand_path("../fixtures/Carthfile.private", __FILE__)
    file = File.open(path).read
    post '/carthfile.private', body: file
    last_response.body.must_include "[{\"name\":\"Quick/Quick\",\"version\":\"~>0.9\",\"type\":\"development\"},{\"name\":\"Quick/Nimble\",\"version\":\"~>3.1\",\"type\":\"development\"},{\"name\":\"jspahrsummers/xcconfigs\",\"version\":\"ec5753493605deed7358dec5f9260f503d3ed650\",\"type\":\"development\"}]"
  end

  it "should successfully parse Carthfile.resolved" do
    path = File.expand_path("../fixtures/Carthfile.resolved", __FILE__)
    file = File.open(path).read
    post '/carthfile.resolved', body: file
    last_response.body.must_include "[{\"name\":\"thoughtbot/Argo\",\"version\":\"v2.2.0\",\"type\":\"runtime\"},{\"name\":\"Quick/Nimble\",\"version\":\"v3.1.0\",\"type\":\"runtime\"},{\"name\":\"jdhealy/PrettyColors\",\"version\":\"v3.0.0\",\"type\":\"runtime\"},{\"name\":\"Quick/Quick\",\"version\":\"v0.9.1\",\"type\":\"runtime\"},{\"name\":\"antitypical/Result\",\"version\":\"1.0.2\",\"type\":\"runtime\"},{\"name\":\"jspahrsummers/xcconfigs\",\"version\":\"ec5753493605deed7358dec5f9260f503d3ed650\",\"type\":\"runtime\"},{\"name\":\"Carthage/Commandant\",\"version\":\"0.8.3\",\"type\":\"runtime\"},{\"name\":\"ReactiveCocoa/ReactiveCocoa\",\"version\":\"v4.0.1\",\"type\":\"runtime\"},{\"name\":\"Carthage/ReactiveTask\",\"version\":\"0.9.1\",\"type\":\"runtime\"}]"
  end

  # it "should successfully parse Gemfiles" do
  #   path = File.expand_path("../fixtures/Gemfile", __FILE__)
  #   file = File.open(path).read
  #   post '/gemfile', body: file
  #   last_response.body.must_include "[{\"name\":\"oj\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"rails\",\"version\":\"= 4.2.0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"leveldb-ruby\",\"version\":\"= 0.15\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"spring\",\"version\":\">= 0\",\"type\":\"development\",\"groups\":[\"development\"]},{\"name\":\"thin\",\"version\":\">= 0\",\"type\":\"development\",\"groups\":[\"development\"]},{\"name\":\"puma\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"production\"]},{\"name\":\"rails_12factor\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"production\"]},{\"name\":\"bugsnag\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"production\"]}]"
  # end
  #
  # it "should successfully parse Podfiles" do
  #   path = File.expand_path("../fixtures/Podfile", __FILE__)
  #   file = File.open(path).read
  #   post '/podfile', body: file
  #   last_response.body.must_include "[{\"name\":\"Artsy-UIButtons\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"ORStackView\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"FLKAutoLayout\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"ISO8601DateFormatter\",\"version\":\"= 0.7\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"ARCollectionViewMasonryLayout\",\"version\":\"~> 2.0.0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"SDWebImage\",\"version\":\"~> 3.7\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"SVProgressHUD\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"CardFlight\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Stripe\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"ECPhoneNumberFormatter\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"UIImageViewAligned\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"DZNWebViewController\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Reachability\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"ARTiledImageView\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"XNGMarkdownParser\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"SwiftyJSON\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Swift-RAC-Macros\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"FBSnapshotTestCase\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Nimble-Snapshots\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Quick\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]},{\"name\":\"Forgeries\",\"version\":\">= 0\",\"type\":\"runtime\",\"groups\":[\"default\"]}]"
  # end
end
