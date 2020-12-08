require_relative '../robot_rover'

RSpec.describe 'RobotRover' do
  let(:robot) { RobotRover.new }

  describe '#report' do
    subject { robot.report }

    it { expect(subject).to eq("Robot at (0,0) facing North") }
  end

  describe '#move' do
    subject { robot.move }

    context 'when facing north' do
      it 'moves north' do
        subject
        expect(robot.coordinates).to eq([0,1])
      end
    end

    context 'when facing south' do
      before { robot.direction = 2 }

      it 'moves south' do
        subject
        expect(robot.coordinates).to eq([0,-1])
      end
    end

    context 'when facing west' do
      before { robot.direction = 3 }

      it 'moves west' do
        subject
        expect(robot.coordinates).to eq([-1,0])
      end
    end

    context 'when facing east' do
      before { robot.direction = 1 }

      it 'moves east' do
        subject
        expect(robot.coordinates).to eq([1,0])
      end
    end
  end

  describe '#turn' do
    subject { robot.turn(keyword: keyword) }

    context 'when turning left' do
      let(:keyword) { 'L' }

      context 'when facing north' do
        it 'faces to west' do
          subject
          expect(robot.direction).to eq(3)
        end
      end

      context 'when facing west' do
        before { robot.direction = 3 }

        it 'faces to south' do
          subject
          expect(robot.direction).to eq(2)
        end
      end

      context 'when facing south' do
        before { robot.direction = 2 }

        it 'faces to east' do
          subject
          expect(robot.direction).to eq(1)
        end
      end

      context 'when facing east' do
        before { robot.direction = 1 }

        it 'faces to north' do
          subject
          expect(robot.direction).to eq(0)
        end
      end
    end

    context 'when turning right' do
      let(:keyword) { 'R' }

      context 'when facing north' do
        it 'faces to east' do
          subject
          expect(robot.direction).to eq(1)
        end
      end

      context 'when facing east' do
        before { robot.direction = 1 }

        it 'faces to north' do
          subject
          expect(robot.direction).to eq(2)
        end
      end

      context 'when facing south' do
        before { robot.direction = 2 }

        it 'faces to east' do
          subject
          expect(robot.direction).to eq(3)
        end
      end

      context 'when facing west' do
        before { robot.direction = 3 }

        it 'faces to south' do
          subject
          expect(robot.direction).to eq(0)
        end
      end

    end
  end
end