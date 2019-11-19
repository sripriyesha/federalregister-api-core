require 'spec_helper'

describe Content::GpoModsDownloader do
  let(:issue) { Issue.create(:publication_date => "2099-01-01") }
  let(:reprocessed_issue) { ReprocessedIssue.create(:issue => issue) }
  let(:mods_downloader) { Content::GpoModsDownloader.new(reprocessed_issue.id) }

  describe "#generate_diffs" do
    it "calls #diff and #html_diff" do
      FrDiff.any_instance.stub(:diff).and_return("")
      FrDiff.any_instance.stub(:html_diff).and_return("")

      expect(mods_downloader).to receive(:diff).once.and_call_original
      expect(mods_downloader).to receive(:html_diff).once.and_call_original

      mods_downloader.generate_diffs
    end

    it "saves the results of diff to the reprocessed issue" do
      Content::GpoModsDownloader.any_instance.stub(:diff).and_return('stubbed diff')
      Content::GpoModsDownloader.any_instance.stub(:html_diff).and_return('stubbed html_diff')

      mods_downloader.generate_diffs
      reprocessed_issue.reload

      reprocessed_issue.diff.should == 'stubbed diff'
      reprocessed_issue.html_diff.should == 'stubbed html_diff'
    end

    it "returns false if there is an error" do
      #FrDiff.stubs(:diff).raises(FrDiff::CommandLineError)

      #mods_downloader.generate_diffs.should == false
    end
  end
end
