class PagesController < ApplicationController
    def about
        @title = 'About Us'
        @body = 'This is a rails backend project created by Mostafa ElDahshan'
    end
end
