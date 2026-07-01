# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1EGF\seeds\seed_1\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 3.102 A
- tm_score_ca_ordered: 0.5212707540012371
- heavy_atom_rmsd: 4.411 A
- sidechain_heavy_atom_rmsd: 5.211 A
- **all-atom quality (honest):** heavy 4.411 A, sidechain 5.211 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1176
- bin_accuracy: 0.772

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.5028784234347343 -> 2.81483359229414 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1023761831855556
- ga_delta_rmsd: -0.7190170226198482  ga_fitness_mode: energy
- pre_local_rmsd: 3.124665420657282  localized_anchor_rmsd: 3.1024320812565436

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E50-L51 → 43 conflicts (84%); S1-I22 → 4 conflicts (8%)
- explained: 47/51 conflicts by 2 root cause(s)
- metrics: hubs=14 (frac 0.275), conflicts/hub=3.6, max_incompat=4.66Å, chain_span=0.333
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E50-L51 + S1-I22 — explain ~47/51 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 8.49, 10 conflict(s); suspect input ~`C32` (group: push_out)
  - push-out (wants farther): L51@26.1Å(now 22.6,conf 0.68), E50@25.7Å(now 22.4,conf 0.64)
  - L51↔N31: targets 26.1/6.6Å but partners are 16.8Å apart → too_close_together by 2.6Å
  - E50↔C32: targets 25.7/8.8Å but partners are 14.0Å apart → too_close_together by 2.9Å
  - L51↔V33: targets 26.1/11.4Å but partners are 11.9Å apart → too_close_together by 2.8Å
- **M20** — severity 6.80, 9 conflict(s); suspect input ~`N31` (group: push_out)
  - push-out (wants farther): L51@27.0Å(now 24.0,conf 0.83), E50@26.9Å(now 24.1,conf 0.82)
  - L51↔N31: targets 27.0/7.2Å but partners are 16.8Å apart → too_close_together by 2.9Å
  - E50↔N31: targets 26.9/7.2Å but partners are 16.7Å apart → too_close_together by 2.9Å
  - E50↔C32: targets 26.9/10.5Å but partners are 14.0Å apart → too_close_together by 2.4Å
- **V18** — severity 6.69, 8 conflict(s); suspect input ~`V33` (group: push_out)
  - push-out (wants farther): L51@23.3Å(now 19.9,conf 0.50), E50@23.2Å(now 20.0,conf 0.50)
  - L51↔V33: targets 23.3/8.4Å but partners are 11.9Å apart → too_close_together by 3.1Å
  - E50↔V33: targets 23.2/8.4Å but partners are 11.9Å apart → too_close_together by 2.9Å
  - L51↔I34: targets 23.3/12.0Å but partners are 8.7Å apart → too_close_together by 2.7Å
- **N31** — severity 3.33, 4 conflict(s); suspect input ~`I34` (group: push_out)
  - push-out (wants farther): L51@21.1Å(now 16.8,conf 0.44), E50@21.0Å(now 16.7,conf 0.43)
  - L51↔I34: targets 21.1/9.5Å but partners are 8.7Å apart → too_close_together by 2.9Å
  - E50↔I34: targets 21.0/9.5Å but partners are 8.7Å apart → too_close_together by 2.8Å
  - E50↔W48: targets 21.0/16.6Å but partners are 2.4Å apart → too_close_together by 2.1Å
- **S27** — severity 3.23, 3 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@15.9Å(now 12.0,conf 0.34)
  - I22↔S1: targets 5.7/15.9Å but partners are 5.9Å apart → too_close_together by 4.3Å
  - E23↔S1: targets 6.9/15.9Å but partners are 6.0Å apart → too_close_together by 3.0Å
  - H21↔S1: targets 6.2/15.9Å but partners are 7.6Å apart → too_close_together by 2.1Å
- **D26** — severity 2.96, 2 conflict(s); suspect input ~`S1` (group: push_out)
  - pull-in (wants closer): L51@27.5Å(now 30.5,conf 1.00), E50@27.5Å(now 30.2,conf 1.00), W49@27.5Å(now 30.1,conf 0.98)
  - push-out (wants farther): S1@15.8Å(now 11.0,conf 0.34)
  - E23↔S1: targets 5.3/15.8Å but partners are 6.0Å apart → too_close_together by 4.6Å
  - I22↔S1: targets 5.9/15.8Å but partners are 5.9Å apart → too_close_together by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=18 · 3-10(G)=14 · coil(C)=6

```
CEEECCHHHHHHEGHHEGGGGGGHGGEGEEGGECGEEEHEHCEGEEHEHEC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=4 · sheet=38
  - S7 ↔ G11  (helix)
  - S8 ↔ Y12  (helix)
  - G11 ↔ N15  (helix)
  - Y12 ↔ G16  (helix)
  - G4 ↔ C13  (sheet)
  - G4 ↔ G17  (sheet)
  - C13 ↔ T29  (sheet)
  - C13 ↔ C30  (sheet)
  - C13 ↔ V33  (sheet)
  - G17 ↔ T29  (sheet)
  - G17 ↔ C30  (sheet)
  - G17 ↔ V33  (sheet)
  - G17 ↔ Y36  (sheet)
  - G17 ↔ S37  (sheet)
  - T29 ↔ S37  (sheet)
  - T29 ↔ G38  (sheet)
  - T29 ↔ R40  (sheet)
  - C30 ↔ Y36  (sheet)
  - C30 ↔ S37  (sheet)
  - C30 ↔ G38  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=89 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9354 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1EGF.ensemble.pdb`)
- RMSF mean=0.043Å max=0.188Å (per-residue in .per_residue.csv)
- most flexible residues: 6, 21, 51, 27, 47

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1EGF.pae.csv`
- mean=0.029Å · max=0.177Å · AlphaFold-PAE analog (low block = rigid unit/domain)
