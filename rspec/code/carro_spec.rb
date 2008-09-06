class Carro
  attr_accessor :rodas  
  def initialize
    @ignition = false
  end
  def liga!
    @ignition = true
  end  
  def desliga!
    @ignition = false
  end  
  def ligado?
    @ignition
  end
end
class Motorista  
  def partida(carro)
    carro.liga!
  end
end
describe Carro do
  before(:each) do
    @fuscao = Carro.new
  end
  it "deve ter quatro rodas" do    
    @fuscao.rodas.should eql(3)
  end
  
  it "deve estar ligado" do
    @fuscao.should_not be_ligado
  end
end

describe Motorista do
  before(:each) do
    @motorista = Motorista.new
    @carro = mock(Carro)
    @carro = mock(Carro, :ligar! => true)    
#    @carro.stub!(:ligar!).and_return(true)
  end
  
  it "should ligar o carro " do
    @motorista.ligar(@carro).should be_true    
  end
end