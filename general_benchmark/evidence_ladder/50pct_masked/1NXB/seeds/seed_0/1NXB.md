# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1NXB\seeds\seed_0\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 0.711 A
- tm_score_ca_ordered: 0.9410992438245455
- heavy_atom_rmsd: 3.233 A
- sidechain_heavy_atom_rmsd: 4.148 A
- **all-atom quality (honest):** heavy 3.233 A, sidechain 4.148 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 826
- bin_accuracy: 0.930

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7112719261275695
- ga_delta_rmsd: 1.1706073397617667  ga_fitness_mode: energy
- pre_local_rmsd: 0.7162451694304875  localized_anchor_rmsd: 0.7112972268413182

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=28 · 3-10(G)=14 · coil(C)=11

```
CEGGEEHEECCEEEGECCHHHEGEGGEECEGECEEGGGECEEEGGECHEGCEGECEEHHE
```

## Backbone H-bond Network

- total=56 · helix(i→i+4)=0 · sheet=56
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ Y24  (sheet)
  - S8 ↔ T13  (sheet)
  - S8 ↔ Q27  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - C16 ↔ Y24  (sheet)
  - S22 ↔ G39  (sheet)
  - … +36 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=212 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=132 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6103 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
