require 'spec_helper'

describe Appointment do

  it { should respond_to :address_id }
  it { should respond_to :date }
  it { should respond_to :time }
  it { should respond_to :reminders }
  it { should respond_to :photos }

  it { should respond_to :contractor }
  it { should respond_to :address }

end
