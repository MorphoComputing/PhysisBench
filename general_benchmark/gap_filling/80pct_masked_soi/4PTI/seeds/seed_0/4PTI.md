# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.726 A
- tm_score_ca_ordered: 0.9284187455735756
- heavy_atom_rmsd: 2.970 A
- sidechain_heavy_atom_rmsd: 3.912 A
- **all-atom quality (honest):** heavy 2.970 A, sidechain 3.912 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 484
- bin_accuracy: 0.857

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7255509074687179
- ga_delta_rmsd: 0.10074565347293662  ga_fitness_mode: energy
- pre_local_rmsd: 0.746386783123247  localized_anchor_rmsd: 0.7255356025484317

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=24 · 3-10(G)=10 · coil(C)=8

```
EHHCGEEEEGECEGEGECECGCEGHECEEGEECGHGEEEEHHCEGEHEHHHHHHHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=3 · sheet=34
  - A47 ↔ M51  (helix)
  - D49 ↔ T53  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - E6 ↔ N23  (sheet)
  - P7 ↔ N23  (sheet)
  - P7 ↔ A26  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ N23  (sheet)
  - Y9 ↔ A15  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ N23  (sheet)
  - G11 ↔ I17  (sheet)
  - A15 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ T31  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=114 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4814 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
