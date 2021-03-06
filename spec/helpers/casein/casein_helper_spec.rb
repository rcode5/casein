require 'spec_helper'
require 'rspec/rails'

describe Casein::CaseinHelper, type: :helper do

  before do
    allow(subject).to receive("link_to").and_return("LINK_TO")
  end

  describe '#casein_get_footer_string' do
    it "builds a form field" do
      expect(helper.casein_get_footer_string false).to include "Running on"
      expect(helper.casein_get_footer_string false).to have_link "Casein", href: 'http://www.github.com/russellquinn/casein'
    end
  end

  describe "#casein_get_version_info" do
    it "returns the correct version info" do
      expect(helper.casein_get_version_info)
    end
  end

  describe "#casein_get_short_version_string" do
    it "returns the correct version info" do
      expect(helper.casein_get_short_version_string).to eql 'v' + Casein::VERSION.split(".").first
    end
  end

  describe "#casein_get_full_version_string" do
    it "returns the correct version info" do
      expect(helper.casein_get_full_version_string).to eql "v" + Casein::VERSION
    end
  end

  describe 'field helpers' do

    let(:helper) { TestActionViewClass.new }
    let(:obj) { TestModel.new }
    let(:opts) { {} }
    let(:builder) { ActionView::Helpers::FormBuilder.new :test_model, obj, helper, opts }

    describe "#casein_color_field" do
      it "builds an html5 color field" do
        field = helper.casein_color_field(builder, obj, 'my_color')
        expect(field).to have_css('.form-group .well .casein-color input#test_model_my_color')
        expect(field).to have_css('.form-group label.control-label', "My Color")
      end
    end

    describe "#casein_telephone_field" do
      it "builds an html5 telephone field" do
        field = helper.casein_telephone_field(builder, obj, 'my_telephone')
        expect(field).to have_css('.form-group .well .casein-telephone input#test_model_my_telephone')
        expect(field).to have_css('.form-group label.control-label', "My Telephone")
      end
    end

    describe "#casein_search_field" do
      it "builds an html5 search field" do
        field = helper.casein_search_field(builder, obj, 'my_search')
        expect(field).to have_css('.form-group .well .casein-search input#test_model_my_search')
        expect(field).to have_css('.form-group label.control-label', "My Search")
      end
    end

    describe "#casein_url_field" do
      it "builds an html5 url field" do
        field = helper.casein_url_field(builder, obj, 'my_url')
        expect(field).to have_css('.form-group .well .casein-url input#test_model_my_url')
        expect(field).to have_css('.form-group label.control-label', "My Url")
      end
    end

    describe "#casein_email_field" do
      it "builds an html5 email field" do
        field = helper.casein_email_field(builder, obj, 'my_email')
        expect(field).to have_css('.form-group .well .casein-email input#test_model_my_email')
        expect(field).to have_css('.form-group label.control-label', "My Email")
      end
    end

    describe "#casein_date_field" do
      it "builds an html5 date field" do
        field = helper.casein_date_field(builder, obj, 'my_date')
        expect(field).to have_css('.form-group .well .casein-date input#test_model_my_date')
        expect(field).to have_css('.form-group label.control-label', "My Date")
      end
    end

    describe "#casein_datetime_field" do
      it "builds an html5 datetime field" do
        field = helper.casein_datetime_field(builder, obj, 'my_datetime')
        expect(field).to have_css('.form-group .well .casein-datetime input#test_model_my_datetime')
        expect(field).to have_css('.form-group label.control-label', "My Datetime")
      end
    end

    describe "#casein_datetime_local_field" do
      it "builds an html5 datetime_local field" do
        field = helper.casein_datetime_local_field(builder, obj, 'my_datetime_local')
        expect(field).to have_css('.form-group .well .casein-datetime-local input#test_model_my_datetime_local')
        expect(field).to have_css('.form-group label.control-label', "My Datetime_Local")
      end
    end

    describe "#casein_month_field" do
      it "builds an html5 month field" do
        field = helper.casein_month_field(builder, obj, 'my_month')
        expect(field).to have_css('.form-group .well .casein-month input#test_model_my_month')
        expect(field).to have_css('.form-group label.control-label', "My Month")
      end
    end

    describe "#casein_week_field" do
      it "builds an html5 week field" do
        field = helper.casein_week_field(builder, obj, 'my_week')
        expect(field).to have_css('.form-group .well .casein-week input#test_model_my_week')
        expect(field).to have_css('.form-group label.control-label', "My Week")
      end
    end

    describe "#casein_time_field" do
      it "builds an html5 time field" do
        field = helper.casein_time_field(builder, obj, 'my_time')
        expect(field).to have_css('.form-group .well .casein-time input#test_model_my_time')
        expect(field).to have_css('.form-group label.control-label', "My Time")
      end
    end

    describe "#casein_number_field" do
      it "builds an html5 number field" do
        field = helper.casein_number_field(builder, obj, 'my_number', 1.0..20.0, 0.5)
        expect(field).to have_css('.form-group .well .casein-number input#test_model_my_number[step="0.5"]')
        expect(field).to have_css('.form-group label.control-label', "My Number")
      end
    end

    describe "#casein_range_field" do
      it "builds an html5 range field" do
        field = helper.casein_range_field(builder, obj, 'my_range', 1.0..10.0)
        expect(field).to have_css('.form-group .well .casein-range input#test_model_my_range[max="10.0"]')
        expect(field).to have_css('.form-group label.control-label', "My Range")
      end
    end

  end

end
