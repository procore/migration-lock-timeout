require 'spec_helper'

describe Migration::Lock::Timeout do
  it 'has a version number' do
    expect(Migration::Lock::Timeout::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
