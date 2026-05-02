import { getEnergyData } from '../data';
import * as S from './EnergyDashboard.styles';

export default function EnergyDashboard({ data }) {
  const energyData = getEnergyData(data);

  return (
    <div>
      <S.SectionTitle>Weekly Energy Consumption</S.SectionTitle>
      <S.Container>
        {energyData.map((dataItem, idx) => {
          const percentage = Math.min(100, Math.round((dataItem.weekly_usage / dataItem.weekly_limit) * 100));
          let status = 'success';
          if (percentage > 90) status = 'danger';
          else if (percentage > 75) status = 'warning';

          return (
            <S.Card key={idx}>
              <S.Title>Building {dataItem.building.toUpperCase()}</S.Title>
              <S.StatsContainer>
                <S.StatItem>
                  <S.StatLabel>Usage</S.StatLabel>
                  <S.StatValue $status={status}>{dataItem.weekly_usage.toLocaleString()} kWh</S.StatValue>
                </S.StatItem>
                <S.StatItem style={{ alignItems: 'flex-end' }}>
                  <S.StatLabel>Limit</S.StatLabel>
                  <S.StatValue $status="success" style={{ color: '#60a5fa', textShadow: '0 0 10px rgba(96,165,250,0.5)' }}>
                    {dataItem.weekly_limit.toLocaleString()} kWh
                  </S.StatValue>
                </S.StatItem>
              </S.StatsContainer>
            </S.Card>
          );
        })}
      </S.Container>
    </div>
  );
}
