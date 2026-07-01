# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 2.649 A
- tm_score_ca_ordered: 0.5793349843185858
- heavy_atom_rmsd: 4.457 A
- sidechain_heavy_atom_rmsd: 5.547 A
- **all-atom quality (honest):** heavy 4.457 A, sidechain 5.547 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1176
- bin_accuracy: 0.692

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6493896441948523
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.723649514267955  localized_anchor_rmsd: 2.6494041925102145

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S1 → 38 conflicts (64%); I22 → 5 conflicts (8%); Y2-H21 → 4 conflicts (7%)
- explained: 47/59 conflicts by 3 root cause(s)
- metrics: hubs=18 (frac 0.353), conflicts/hub=3.3, max_incompat=6.93Å, chain_span=0.569
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S1 + I22 + Y2-H21 — explain ~47/59 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S27** — severity 7.30, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@18.5Å(now 13.4,conf 0.37), Y2@15.1Å(now 11.6,conf 0.34)
  - I22↔S1: targets 6.0/18.5Å but partners are 6.8Å apart → too_close_together by 5.8Å
  - S1↔E23: targets 18.5/7.2Å but partners are 6.6Å apart → too_close_together by 4.7Å
  - I22↔Y2: targets 6.0/15.1Å but partners are 5.5Å apart → too_close_together by 3.6Å
- **D26** — severity 6.28, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@17.9Å(now 12.1,conf 0.36), Y2@14.6Å(now 11.1,conf 0.34)
  - E23↔S1: targets 5.6/17.9Å but partners are 6.6Å apart → too_close_together by 5.7Å
  - I22↔S1: targets 6.2/17.9Å but partners are 6.8Å apart → too_close_together by 4.9Å
  - I22↔Y2: targets 6.2/14.6Å but partners are 5.5Å apart → too_close_together by 2.8Å
- **T29** — severity 5.99, 6 conflict(s); suspect input ~`Y2` (group: push_out)
  - push-out (wants farther): S1@18.8Å(now 15.0,conf 0.38), Y2@15.4Å(now 12.7,conf 0.34)
  - S1↔I22: targets 18.8/7.3Å but partners are 6.8Å apart → too_close_together by 4.7Å
  - H21↔S1: targets 6.7/18.8Å but partners are 8.9Å apart → too_close_together by 3.2Å
  - H21↔Y2: targets 6.7/15.4Å but partners are 6.0Å apart → too_close_together by 2.8Å
- **L25** — severity 5.79, 4 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@19.8Å(now 13.6,conf 0.40), Y2@16.4Å(now 13.2,conf 0.35)
  - I22↔S1: targets 6.0/19.8Å but partners are 6.8Å apart → too_close_together by 6.9Å
  - I22↔Y2: targets 6.0/16.4Å but partners are 5.5Å apart → too_close_together by 4.8Å
  - S1↔H21: targets 19.8/8.7Å but partners are 8.9Å apart → too_close_together by 2.2Å
- **D39** — severity 5.73, 6 conflict(s); suspect input ~`I22` (group: push_out)
  - push-out (wants farther): S1@24.6Å(now 20.7,conf 0.56)
  - S1↔I22: targets 24.6/13.2Å but partners are 6.8Å apart → too_close_together by 4.7Å
  - S1↔T29: targets 24.6/6.8Å but partners are 15.0Å apart → too_close_together by 2.8Å
  - S1↔H21: targets 24.6/13.1Å but partners are 8.9Å apart → too_close_together by 2.7Å
- **Y28** — severity 4.82, 5 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@17.3Å(now 13.1,conf 0.35), Y2@13.9Å(now 10.5,conf 0.34)
  - I22↔S1: targets 6.4/17.3Å but partners are 6.8Å apart → too_close_together by 4.2Å
  - H21↔S1: targets 5.3/17.3Å but partners are 8.9Å apart → too_close_together by 3.2Å
  - H21↔Y2: targets 5.3/13.9Å but partners are 6.0Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=15 · 3-10(G)=17 · coil(C)=5

```
EEEEGCHHHHGHEGHHEGGGCGGGHHEGEEGGGGHEEEHGHHECGGHEECC
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=3 · sheet=18
  - S8 ↔ Y12  (helix)
  - Y12 ↔ G16  (helix)
  - G35 ↔ D39  (helix)
  - C13 ↔ T29  (sheet)
  - C13 ↔ C30  (sheet)
  - G17 ↔ T29  (sheet)
  - G17 ↔ C30  (sheet)
  - G17 ↔ Y36  (sheet)
  - G17 ↔ S37  (sheet)
  - T29 ↔ S37  (sheet)
  - T29 ↔ G38  (sheet)
  - C30 ↔ Y36  (sheet)
  - C30 ↔ S37  (sheet)
  - C30 ↔ G38  (sheet)
  - C30 ↔ T43  (sheet)
  - Y36 ↔ T43  (sheet)
  - Y36 ↔ W48  (sheet)
  - Y36 ↔ W49  (sheet)
  - S37 ↔ T43  (sheet)
  - S37 ↔ W48  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=173 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=87 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9833 (restraint satisfaction; lower=better)
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
- RMSF mean=0.035Å max=0.11Å (per-residue in .per_residue.csv)
- most flexible residues: 6, 43, 48, 47, 4

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1EGF.pae.csv`
- mean=0.028Å · max=0.128Å · AlphaFold-PAE analog (low block = rigid unit/domain)
