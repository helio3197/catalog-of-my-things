require './label'

describe Label do
  before :each do
    @label = Label.new('title 1', 'blue')
  end

  it 'Return a label' do
    expect(@label).to be_an_instance_of Label
  end

  it 'Label should have a title' do
    expect(@label.title).to eq('title 1')
  end

  it 'Label should have a color' do
    expect(@label.color).to eq('blue')
  end
end
