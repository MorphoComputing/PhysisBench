# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 0.985 A
- tm_score_ca_ordered: 0.851257251740107
- heavy_atom_rmsd: 3.201 A
- sidechain_heavy_atom_rmsd: 4.058 A
- **all-atom quality (honest):** heavy 3.201 A, sidechain 4.058 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 264
- bin_accuracy: 0.936

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain reason=accepted tested=33
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.090526792750432 -> 1.4786574721397767 A
- topology_reconvergence: applied=True accepted=22/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9850144328218102
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.98507845412677  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=8 · 3-10(G)=6 · coil(C)=0

```
EEHHEHHHHHEHGGGGHHHHHHHHHHHEGHEGHEE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=10 · sheet=3
  - E3 ↔ M7  (helix)
  - H8 ↔ K12  (helix)
  - M17 ↔ E21  (helix)
  - E18 ↔ W22  (helix)
  - R19 ↔ L23  (helix)
  - V20 ↔ R24  (helix)
  - E21 ↔ K25  (helix)
  - W22 ↔ K26  (helix)
  - L23 ↔ L27  (helix)
  - K26 ↔ V30  (helix)
  - Q5 ↔ G11  (sheet)
  - Q28 ↔ V34  (sheet)
  - Q28 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=89 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=4 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6063 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HPH.ensemble.pdb`)
- RMSF mean=0.769Å max=2.811Å (per-residue in .per_residue.csv)
- most flexible residues: 35, 9, 1, 8, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HPH.pae.csv`
- mean=0.242Å · max=2.548Å · AlphaFold-PAE analog (low block = rigid unit/domain)
