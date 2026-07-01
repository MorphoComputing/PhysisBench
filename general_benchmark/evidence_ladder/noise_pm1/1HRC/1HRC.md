# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HRC\seeds\seed_0\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.575 A
- tm_score_ca_ordered: 0.9771386197979762
- heavy_atom_rmsd: 2.582 A
- sidechain_heavy_atom_rmsd: 3.310 A
- **all-atom quality (honest):** heavy 2.582 A, sidechain 3.310 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3256
- bin_accuracy: 0.650

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.7155545147766413 -> 0.6395065958189159 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5746729798799701
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5843592373096039  localized_anchor_rmsd: 0.5746318557851734

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L67 → 31 conflicts (28%); F35 → 13 conflicts (12%)
- explained: 44/112 conflicts by 2 root cause(s)
- metrics: hubs=38 (frac 0.373), conflicts/hub=2.9, max_incompat=4.58Å, chain_span=0.951
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L67 + F35 — explain ~44/112 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L67** — severity 19.23, 24 conflict(s); suspect input ~`N51` (group: pull_in)
  - pull-in (wants closer): I8@9.7Å(now 12.3,conf 0.34), L34@11.2Å(now 13.8,conf 0.34), N51@10.4Å(now 13.5,conf 0.34)
  - N51↔E89: targets 10.4/8.5Å but partners are 23.0Å apart → too_far_apart by 4.2Å
  - K87↔N51: targets 9.1/10.4Å but partners are 23.3Å apart → too_far_apart by 3.9Å
  - K52↔N51: targets 17.7/10.4Å but partners are 3.7Å apart → too_close_together by 3.6Å
- **G28** — severity 7.55, 8 conflict(s); suspect input ~`G23` (group: pull_in)
  - pull-in (wants closer): K78@6.8Å(now 9.5,conf 0.38)
  - K78↔G23: targets 6.8/10.0Å but partners are 20.8Å apart → too_far_apart by 4.0Å
  - K78↔K24: targets 6.8/8.5Å but partners are 18.5Å apart → too_far_apart by 3.2Å
  - K78↔T18: targets 6.8/7.7Å but partners are 17.5Å apart → too_far_apart by 3.0Å
- **M64** — severity 4.76, 6 conflict(s); suspect input ~`F35` (group: pull_in)
  - pull-in (wants closer): F35@9.4Å(now 12.9,conf 0.34)
  - F35↔K87: targets 9.4/7.2Å but partners are 19.8Å apart → too_far_apart by 3.1Å
  - G33↔F35: targets 17.8/9.4Å but partners are 5.6Å apart → too_close_together by 2.8Å
  - E68↔F35: targets 6.1/9.4Å but partners are 17.7Å apart → too_far_apart by 2.2Å
- **T18** — severity 4.37, 6 conflict(s); suspect input ~`K6` (group: push_out)
  - pull-in (wants closer): Y73@18.5Å(now 22.6,conf 0.37), G83@15.9Å(now 18.6,conf 0.34)
  - push-out (wants farther): K7@16.9Å(now 13.7,conf 0.35)
  - K6↔K7: targets 10.7/16.9Å but partners are 3.6Å apart → too_close_together by 2.6Å
  - Y73↔G23: targets 18.5/5.6Å but partners are 26.3Å apart → too_far_apart by 2.2Å
  - K7↔F9: targets 16.9/9.7Å but partners are 4.9Å apart → too_close_together by 2.2Å
- **N51** — severity 4.20, 6 conflict(s); suspect input ~`L67` (group: push_out)
  - pull-in (wants closer): L67@10.4Å(now 13.5,conf 0.34)
  - push-out (wants farther): K72@14.2Å(now 11.6,conf 0.34)
  - I74↔K72: targets 6.0/14.2Å but partners are 5.4Å apart → too_close_together by 2.8Å
  - E89↔L67: targets 22.8/10.4Å but partners are 9.9Å apart → too_close_together by 2.5Å
  - E68↔L67: targets 16.1/10.4Å but partners are 3.6Å apart → too_close_together by 2.1Å
- **R37** — severity 4.13, 4 conflict(s); suspect input ~`Y96` (group: push_out)
  - push-out (wants farther): Y96@19.7Å(now 16.3,conf 0.40)
  - L34↔Y96: targets 5.5/19.7Å but partners are 11.1Å apart → too_close_together by 3.1Å
  - Y96↔K98: targets 19.7/10.7Å but partners are 5.4Å apart → too_close_together by 3.7Å
  - Y96↔L97: targets 19.7/13.8Å but partners are 3.3Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=41 · strand(E)=31 · 3-10(G)=19 · coil(C)=11

```
EEHHHHHHHHEEGHHCEGCECHECGEHEEGHEHHEHEEHHCEGGECEEGHHGGEGECGEHEHHHEGHHEHCGHCGHEHEGEGECCEGHHHEHHHHHHHGGHE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=17 · sheet=49
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - V10 ↔ A14  (helix)
  - T27 ↔ L31  (helix)
  - G36 ↔ G40  (helix)
  - E60 ↔ M64  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - T88 ↔ D92  (helix)
  - E89 ↔ L93  (helix)
  - R90 ↔ I94  (helix)
  - D92 ↔ Y96  (helix)
  - L93 ↔ L97  (helix)
  - I94 ↔ K98  (helix)
  - L97 ↔ T101  (helix)
  - Q11 ↔ H17  (sheet)
  - K12 ↔ H17  (sheet)
  - K12 ↔ G28  (sheet)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=379 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=158 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0943 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HRC.ensemble.pdb`)
- RMSF mean=0.057Å max=0.351Å (per-residue in .per_residue.csv)
- most flexible residues: 3, 2, 1, 5, 46

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HRC.pae.csv`
- mean=0.039Å · max=0.318Å · AlphaFold-PAE analog (low block = rigid unit/domain)
