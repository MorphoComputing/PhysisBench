# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1NXB/sequence/1NXB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1NXB/seeds/seed_1/1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 0.578 A
- tm_score_ca_ordered: 0.9682454277973069
- heavy_atom_rmsd: 2.869 A
- sidechain_heavy_atom_rmsd: 3.843 A
- **all-atom quality (honest):** heavy 2.869 A, sidechain 3.843 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.017
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1653
- bin_accuracy: 0.947

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=0.8963572671928051 -> 0.7865741217773244 A
- topology_reconvergence: applied=True accepted=27/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5782804851342228
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5801286869761723  localized_anchor_rmsd: 0.5782884177075825

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=30 · 3-10(G)=8 · coil(C)=12

```
CECHEEHCECCEEEGEECHCHEGEGEEEEEHEECGGGEECEEEHGEHHEGCECECEEHHE
```

## Backbone H-bond Network

- total=67 · helix(i→i+4)=1 · sheet=66
  - T44 ↔ G48  (helix)
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ Y24  (sheet)
  - H6 ↔ K26  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - C16 ↔ Y24  (sheet)
  - … +47 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=211 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=133 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6071 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0167

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
